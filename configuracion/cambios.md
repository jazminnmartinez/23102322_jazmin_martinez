## Actividad 1 — Identificar la superficie de ataque

| Elemento | Estado actual | ¿Es necesario? | Riesgo |
|---|---|---|---|
| Puerto PostgreSQL | 5432 | Sí, para permitir las conexiones necesarias al servidor. | Si es accesible desde redes no autorizadas, puede aumentar la exposición del servicio. |
| Interfaces de escucha | `*` | Deben escucharse únicamente las interfaces que necesite el servidor. | PostgreSQL escucha en todas las interfaces disponibles, lo que puede ampliar la superficie de ataque. |
| Conexiones remotas | En la captura se observan conexiones locales mediante `::1`; no se confirma una conexión remota. | Solo deben permitirse las conexiones que requiera el entorno. | No se puede confirmar exposición remota únicamente con esta captura. |
| Usuarios administrativos | Se observa el usuario `postgres` en las sesiones. | Sí, para tareas administrativas autorizadas. | Si se utiliza una cuenta administrativa para tareas normales o aplicaciones, existiría riesgo de privilegios excesivos. |
| SSL/TLS | `off` | Debe evaluarse su necesidad según el tipo de conexión. | Las conexiones que necesiten protección TLS no estarán cifradas mediante SSL si esta opción permanece desactivada. |
| Métodos de autenticación | `password_encryption = scram-sha-256`; las reglas visibles de `pg_hba.conf` también usan `scram-sha-256`. | Sí, se necesita autenticación para controlar el acceso. | El método observado es favorable; aun así, no sustituye los controles de red ni la autorización por roles. |

### Pregunta: ¿Por qué conocer la superficie de ataque debe preceder al hardening?

Conocer la superficie de ataque permite identificar los puertos, interfaces, conexiones, usuarios y configuraciones que podrían representar riesgos. De esta manera, se pueden priorizar los cambios necesarios, reducir la exposición del servidor y evitar modificar componentes que son necesarios para su funcionamiento.

## Actividad 3 — Revisar listen_addresses

**Configuración encontrada:** `listen_addresses = '*'`.

**Interfaces necesarias:** las interfaces que requieran las conexiones autorizadas del laboratorio. Con los resultados disponibles no se puede determinar cuáles son exactamente.

**Interfaces innecesarias:** no se pueden identificar con certeza sin conocer las necesidades de conexión del servidor. Las interfaces que no se necesiten para el servicio deberían excluirse de la escucha.

### Análisis de las arquitecturas

La arquitectura que separa Internet de la red privada mediante controles de firewall reduce mejor la exposición cuando permite únicamente las conexiones autorizadas. De esta forma, el servidor PostgreSQL no queda directamente accesible desde redes externas y se limita la comunicación al segmento que necesita utilizar la base de datos.

En cambio, si el servidor escucha en todas las interfaces y no existen restricciones de red adecuadas, aumenta la posibilidad de que se intente acceder al servicio desde orígenes no autorizados.

La configuración `listen_addresses = '*'` no significa por sí sola que cualquier equipo pueda conectarse, ya que también intervienen las reglas de `pg_hba.conf` y el firewall. Por ello, deben revisarse conjuntamente estos controles.

## Actividad 4 — Revisar pg_hba.conf

### Reglas identificadas

| Tipo de conexión | Base de datos | Usuario | Dirección de origen | Método de autenticación |
|---|---|---|---|---|
| `local` | `all` | `all` | No aplica | `scram-sha-256` |
| `host` | `all` | `all` | `127.0.0.1` | `scram-sha-256` |
| `host` | `all` | `all` | `::1` | `scram-sha-256` |
| `local` | `replication` | `all` | No aplica | `scram-sha-256` |
| `host` | `replication` | `all` | `127.0.0.1` | `scram-sha-256` |
| `host` | `replication` | `all` | `::1` | `scram-sha-256` |

### Identificación solicitada

- **Reglas locales:** dos reglas de tipo `local`, una para todas las bases de datos y otra para `replication`.
- **Reglas para conexiones IPv4:** dos reglas `host` con la dirección `127.0.0.1`.
- **Reglas para conexiones IPv6:** dos reglas `host` con la dirección `::1`.
- **Bases de datos afectadas:** `all` y `replication`.
- **Usuarios afectados:** `all`.
- **Redes permitidas en las reglas visibles:** únicamente las direcciones locales IPv4 `127.0.0.1` e IPv6 `::1` para las conexiones TCP mostradas. Las reglas `local` corresponden a conexiones locales y no utilizan una dirección IP.
- **Método de autenticación:** `scram-sha-256` en las seis reglas.

### Revisión de reglas excesivamente amplias

En las seis reglas visibles no aparecen las direcciones `0.0.0.0/0` ni `::/0`. Por tanto, no se observa una regla de acceso TCP que permita cualquier origen en esta captura.

Antes de concluir que todo el archivo está restringido, es necesario comprobar que no existan reglas adicionales fuera de las mostradas.

## Actividad 5 — Analizar una regla permisiva

**Regla actual:**

`host    all    all    0.0.0.0/0    scram-sha-256`

**¿Qué bases de datos permite?**

Permite conexiones a todas las bases de datos (`all`), sujetas a las demás condiciones de acceso de PostgreSQL.

**¿Qué usuarios permite?**

Permite conexiones de todos los usuarios (`all`), siempre que puedan superar la autenticación y los demás controles aplicables.

**¿Qué direcciones de origen permite?**

Permite conexiones desde cualquier dirección IPv4 (`0.0.0.0/0`).

**¿Qué método de autenticación utiliza?**

Utiliza `scram-sha-256`.

**Problema:**

La regla es demasiado amplia porque permite intentar conexiones desde cualquier dirección IPv4, hacia cualquier base de datos y con cualquier usuario. Aunque utiliza un método de autenticación seguro, no restringe suficientemente el origen, la base de datos ni el usuario.

**Origen que realmente necesita acceso:**

Pendiente de confirmar. Se debe identificar la dirección IP o la red autorizada que realmente necesita conectarse al servidor.

**Base de datos:**

Pendiente de confirmar. Debe indicarse únicamente la base de datos que necesita utilizar la aplicación o el servicio autorizado.

**Usuario:**

Pendiente de confirmar. Debe indicarse el usuario específico que necesita conectarse.

**Regla propuesta:**

`host    NOMBRE_BASE_DATOS    USUARIO_AUTORIZADO    IP_O_RED_AUTORIZADA    scram-sha-256`

Esta propuesta es conceptual. Antes de utilizarla, deben sustituirse los campos por los datos reales del laboratorio y verificar qué conexiones necesita el servicio. No se modifica la regla actual en esta actividad.

## Actividad 6 — Aplicar mínimo privilegio a conexiones

### Regla propuesta

`host    NOMBRE_BASE_DATOS    USUARIO_AUTORIZADO    IP_O_RED_AUTORIZADA    scram-sha-256`

### Restricciones aplicadas

- **Base de datos:** se especificará únicamente la base de datos que necesita la aplicación.
- **Usuario:** se utilizará un usuario específico para la aplicación, sin recurrir a una cuenta administrativa si no es necesario.
- **Origen:** se permitirá únicamente la dirección IP o red autorizada que necesite conectarse.
- **Método de autenticación:** se mantiene `scram-sha-256`.

### Justificación

El principio de mínimo privilegio establece que las conexiones deben limitarse a los recursos y usuarios necesarios. Una regla específica reduce la exposición frente a una regla que permite cualquier origen, cualquier base de datos y cualquier usuario.

La regla propuesta es un diseño pendiente de completar con los datos reales del entorno. No se ha aplicado ningún cambio al archivo `pg_hba.conf` durante esta actividad.

## Actividad 7 — Revisar autenticación

### Preguntas

**1. ¿Qué diferencia existe entre autenticación y autorización?**

La autenticación verifica la identidad del usuario que intenta conectarse a PostgreSQL. La autorización determina qué acciones puede realizar ese usuario, por ejemplo, consultar, insertar, modificar o eliminar datos.

**2. ¿Qué protege `scram-sha-256`?**

`SCRAM-SHA-256` protege el proceso de autenticación mediante un mecanismo de desafío y respuesta que evita enviar la contraseña directamente como texto plano durante la autenticación. PostgreSQL también lo utiliza para almacenar verificadores de contraseñas de forma más segura que los mecanismos heredados como `md5`.

**3. ¿Por qué una contraseña almacenada mediante un mecanismo de autenticación no debe confundirse con cifrado reversible?**

Porque el mecanismo almacena un verificador derivado de la contraseña, no una versión cifrada que pueda descifrarse para recuperar la contraseña original. Durante la autenticación, el servidor comprueba la respuesta del cliente mediante el mecanismo correspondiente. Por eso, este almacenamiento no equivale a cifrado reversible.

**4. ¿Qué sucede si una cuenta tiene permisos excesivos aunque utilice una contraseña fuerte?**

La cuenta sigue representando un riesgo, porque si alguien consigue utilizarla, podría realizar acciones para las que tiene privilegios innecesarios. Por ejemplo, una cuenta de aplicación con privilegios de superusuario podría modificar configuraciones o acceder a información más allá de lo que necesita. Por eso, además de utilizar autenticación segura, se deben aplicar autorización adecuada y el principio de mínimo privilegio.

### Conclusión

El valor observado, `scram-sha-256`, corresponde al mecanismo recomendado en la práctica para almacenar nuevas contraseñas. Sin embargo, la seguridad no depende únicamente de la contraseña: también requiere controlar los privilegios de cada cuenta y restringir las conexiones.

## Actividad 8 — Revisar usuarios y privilegios

| Rol | LOGIN | SUPERUSER | CREATEROLE | CREATEDB | Función |
|---|---|---|---|---|---|
| analista | No | No | No | No | Rol posiblemente destinado a tareas de análisis; confirmar su uso. |
| pg_checkpoint | No | No | No | No | Rol interno de PostgreSQL relacionado con operaciones de checkpoint. |
| pg_create_subscription | No | No | No | No | Rol predefinido relacionado con la creación de suscripciones. |
| pg_database_owner | No | No | No | No | Rol predefinido asociado al propietario de la base de datos actual. |
| pg_execute_server_program | No | No | No | No | Rol predefinido que permite ejecutar programas en el servidor cuando se concede. |
| pg_monitor | No | No | No | No | Rol predefinido para tareas de monitorización. |
| pg_read_all_data | No | No | No | No | Rol predefinido con permisos de lectura sobre los datos. |
| pg_read_all_settings | No | No | No | No | Rol predefinido para consultar la configuración. |
| pg_read_all_stats | No | No | No | No | Rol predefinido para consultar estadísticas. |
| pg_read_server_files | No | No | No | No | Rol predefinido relacionado con la lectura de archivos del servidor. |
| pg_signal_backend | No | No | No | No | Rol predefinido relacionado con el envío de señales a procesos del servidor. |
| pg_stat_scan_tables | No | No | No | No | Rol predefinido relacionado con funciones de estadísticas que pueden examinar tablas. |
| pg_use_reserved_connections | No | No | No | No | Rol predefinido relacionado con el uso de conexiones reservadas. |
| pg_write_all_data | No | No | No | No | Rol predefinido con permisos de escritura sobre los datos. |
| pg_read_server_files | No | No | No | No | Rol predefinido relacionado con la lectura de archivos del servidor. |
| pg_write_server_files | No | No | No | No | Rol predefinido relacionado con la escritura de archivos del servidor. |
| postgres | Sí | Sí | Sí | Sí | Cuenta administrativa y superusuario de PostgreSQL. |
| soporte | No | No | No | No | Rol posiblemente destinado a tareas de soporte; confirmar su uso. |

### Identificación de roles

- **Superusuarios:** `postgres`.
- **Roles que pueden iniciar sesión:** `postgres`, según los resultados proporcionados.
- **Roles con CREATEROLE:** `postgres`.
- **Roles con CREATEDB:** `postgres`.
- **Roles posiblemente utilizados por aplicaciones:** `analista` y `soporte` podrían tener funciones específicas, pero su propósito debe confirmarse antes de clasificarlos como cuentas de aplicación.
- **Roles potencialmente innecesarios:** no es posible determinarlo solo con esta consulta. Se debe verificar su uso y las membresías antes de considerar cambios.

### Pregunta: ¿Por qué no debería utilizarse una cuenta SUPERUSER como cuenta normal de una aplicación?

No debería utilizarse una cuenta `SUPERUSER` para una aplicación porque tiene privilegios administrativos muy amplios. Si la aplicación sufre una vulnerabilidad o sus credenciales se ven comprometidas, un atacante podría realizar operaciones críticas sobre el servidor y las bases de datos. Es más seguro crear una cuenta específica para la aplicación y concederle únicamente los permisos que necesita, siguiendo el principio de mínimo privilegio.

## Actividad 9 — Separar cuentas administrativas y de aplicación

### Diseño conceptual de cuentas

| Cuenta | Propósito | LOGIN | Privilegios |
|---|---|---|---|
| DBA | Administración y mantenimiento de PostgreSQL. | Sí | Administrativos, reservados para tareas que los requieran. |
| APP | Conexión utilizada por el software para operar con la base de datos. | Sí | Mínimos necesarios para las operaciones de la aplicación. |
| CONSULTA | Consultas de información autorizada. | Sí | Solo lectura sobre las tablas o vistas necesarias. |

### Pregunta: ¿Qué riesgo existe si la aplicación se conecta utilizando una cuenta administrativa?

Si la aplicación utiliza una cuenta administrativa, una vulnerabilidad del software o el robo de sus credenciales podría permitir realizar operaciones privilegiadas, modificar o eliminar datos, cambiar configuraciones o afectar otras bases de datos. Al utilizar una cuenta APP con permisos limitados, se reduce el alcance del daño potencial.

## Actividad 10 — Revisar extensiones

### Resultado obtenido

| Extensión | Versión | Función | Evaluación |
|---|---|---|---|
| `pgcrypto` | 1.3 | Proporciona funciones criptográficas, como funciones de hash y generación de datos aleatorios. | Confirmar si la aplicación o las prácticas necesitan sus funciones. |
| `plpgsql` | 1.0 | Permite utilizar el lenguaje procedural PL/pgSQL para funciones y procedimientos almacenados. | Habitualmente forma parte del uso normal de PostgreSQL; confirmar si existen funciones que dependan de él. |


- **Extensiones existentes:** `pgcrypto` y `plpgsql`.
- **Extensiones necesarias:** no se puede confirmar únicamente con esta consulta. Se debe revisar si las aplicaciones, funciones o prácticas dependen de ellas.
- **Extensiones instaladas para prácticas:** no se puede determinar con la información disponible si `pgcrypto` se instaló específicamente para una práctica.
- **Funcionalidad potencialmente innecesaria:** `pgcrypto` podría no ser necesaria en otro entorno si ningún componente utiliza sus funciones. Esto debe verificarse antes de considerar su eliminación.
- **Consideración de seguridad:** tener instalada una extensión no significa automáticamente que el sistema sea inseguro. El objetivo del hardening es habilitar únicamente la funcionalidad necesaria para el propósito del sistema.

## Actividad 11 — Revisar configuración relacionada con conexiones

Los valores actuales obtenidos mediante las consultas fueron:

- `max_connections`: 100. Permite hasta 100 conexiones simultáneas al servidor PostgreSQL.
- `superuser_reserved_connections`: 3. Reserva tres conexiones para que los superusuarios puedan acceder al servidor cuando las conexiones ordinarias están cerca del límite.
- `statement_timeout`: 0. No existe un límite de tiempo configurado mediante este parámetro para la ejecución de sentencias.
- `idle_in_transaction_session_timeout`: 0. No existe un límite de tiempo configurado mediante este parámetro para las sesiones que permanecen inactivas con una transacción abierta.

**¿Por qué mantener conexiones indefinidamente abiertas puede representar un problema de disponibilidad o consumo de recursos?**

Las conexiones abiertas consumen recursos del servidor, como memoria y capacidad de procesamiento. Si demasiadas conexiones permanecen abiertas, pueden agotarse las conexiones disponibles e impedir que otros usuarios se conecten. Además, las transacciones inactivas pueden mantener bloqueos y afectar el rendimiento de la base de datos.

## Actividad 14 — Diseñar una política de firewall

### Pregunta: ¿Por qué `pg_hba.conf` y el firewall no son controles equivalentes?

El firewall controla qué conexiones de red pueden llegar al servidor, mientras que `pg_hba.conf` controla qué clientes pueden autenticarse en PostgreSQL según el origen, el usuario, la base de datos y el método de autenticación. Ambos controles se complementan: el firewall limita el acceso a nivel de red y `pg_hba.conf` aplica restricciones dentro de PostgreSQL.


## Actividad 15 — Revisar TLS

### Resultados obtenidos

- `ssl`: `off`.
- `ssl_min_protocol_version`: `TLSv1.2`.

### ¿La conexión actual utiliza TLS?

Con el valor `ssl = off`, la configuración del servidor indica que SSL/TLS está desactivado. Por ello, no se debe asumir que la conexión actual utiliza TLS. 

### Versión

La versión mínima configurada es `TLSv1.2`. Esto no confirma que se esté utilizando TLS en la conexión actual.

### Cipher