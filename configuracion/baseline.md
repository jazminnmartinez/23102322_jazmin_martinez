## Actividad 16 — Comparar configuración antes y después

| Control | Antes | Después | Justificación |
|---|---|---|---|
| `listen_addresses` | `*` | Pendiente de cambio; limitar a las interfaces necesarias. | Reducir la exposición de red de PostgreSQL. |
| `pg_hba.conf` | Reglas visibles para conexiones locales IPv4 e IPv6 con `scram-sha-256`. | Propuesta: permitir solo los orígenes, usuarios y bases de datos necesarios. | Restringir quién puede intentar conectarse. |
| Método de autenticación | `scram-sha-256` en las reglas visibles. | Mantener `scram-sha-256`. | Utilizar un método de autenticación robusto. |
| Usuarios administrativos | Existe el superusuario `postgres`, con inicio de sesión habilitado. | Propuesta: reservar la cuenta administrativa para tareas de administración. | Reducir el riesgo de uso indebido de privilegios elevados. |
| Cuentas de aplicación | No se confirmó una cuenta de aplicación con inicio de sesión habilitado. | Propuesta: crear una cuenta específica con privilegios mínimos, si se necesita. | Evitar el uso de cuentas administrativas para la aplicación. |
| Puerto | `5432` | Mantener `5432`, salvo que los requisitos indiquen otra cosa. | El cambio de puerto por sí solo no sustituye otros controles de seguridad. |
| TLS | `ssl = off`; versión mínima configurada: `TLSv1.2`. | Pendiente de habilitar y verificar TLS si el entorno lo requiere. | Proteger la comunicación de red mediante cifrado. |
| Permisos SO | No verificados. | Pendiente de inspeccionar y ajustar según los requisitos. | Restringir el acceso a los archivos de configuración y datos. |
| Extensiones | `pgcrypto` 1.3 y `plpgsql` 1.0. | Mantener solo las extensiones necesarias, después de verificar su uso. | Reducir la funcionalidad innecesaria sin eliminar componentes requeridos. |
| Conexiones | `max_connections = 100`; `superuser_reserved_connections = 3`; ambos parámetros de timeout consultados están en `0`. | Evaluar límites de tiempo adecuados según la aplicación y la carga. | Evitar consumo excesivo de recursos por consultas o transacciones prolongadas. |


## Actividad 17 — Elaborar checklist de hardening

| # | Control | Verificado | Evidencia |
|---:|---|---|---|
| 1 | Puerto documentado | Sí | `SHOW port`: 5432 |
| 2 | Interfaces de escucha justificadas | Parcial | `SHOW listen_addresses`: `*`; falta justificar las interfaces necesarias. |
| 3 | `pg_hba.conf` revisado | Sí | Captura `03-pg-hba.png` |
| 4 | Redes autorizadas restringidas | Parcial | Reglas visibles revisadas; falta verificar el archivo completo y la política requerida. |
| 5 | Autenticación segura | Sí | `password_encryption = scram-sha-256` y reglas visibles con `scram-sha-256`. |
| 6 | Superusuarios identificados | Sí | Consulta de roles: `postgres`. |
| 7 | Cuentas de aplicación separadas | Pendiente | No se confirmó una cuenta de aplicación con `LOGIN`. |
| 8 | Privilegios mínimos | Parcial | Roles inspeccionados; falta confirmar necesidades y membresías. |
| 9 | Extensiones revisadas | Sí | Consulta: `pgcrypto` 1.3 y `plpgsql` 1.0. |
| 10 | TLS verificado | Parcial | `SHOW ssl`: `off`; falta verificar la conexión mediante `pg_stat_ssl`. |
| 11 | Configuración protegida | Pendiente | Falta revisar los permisos de los archivos de configuración. |
| 12 | Directorio de datos protegido | Pendiente | Falta verificar los permisos del directorio de datos. |
| 13 | Firewall documentado | Sí | Propuesta conceptual de la Actividad 14; no se modificó el firewall. |
| 14 | Actualizaciones documentadas | Pendiente | Falta recopilar evidencia del estado de actualización. |
| 15 | Configuración registrada | Sí | Valores y observaciones documentados en `configuracion/cambios.md`. |
| 16 | Conexiones y límites revisados | Sí | `max_connections`, `superuser_reserved_connections` y timeouts documentados. |
| 17 | Ubicación de archivos identificada | Sí | Rutas de `postgresql.conf`, `pg_hba.conf`, `pg_ident.conf` y directorio de datos. |
| 18 | Registro de conexiones revisado | Sí | `log_connections = off` y `log_disconnections = off`. |

## Actividad 18 — Caso integral

### Identificación de problemas y riesgos

| # | Problema | Riesgo | Control propuesto |
|---:|---|---|---|
| 1 | PostgreSQL acepta conexiones desde cualquier dirección IPv4. | Equipos no autorizados pueden intentar conectarse al servidor. | Restringir el acceso a las direcciones IP y redes autorizadas. |
| 2 | El servidor escucha en todas las interfaces. | PostgreSQL puede quedar expuesto en redes donde no necesita estar disponible. | Configurar `listen_addresses` para escuchar únicamente en las interfaces necesarias. |
| 3 | El firewall permite el puerto 5432 desde cualquier origen. | Aumenta la superficie de ataque y permite intentos de conexión desde redes no confiables. | Permitir el puerto 5432 solo desde las redes autorizadas y denegar los demás orígenes. |
| 4 | `pg_hba.conf` permite `all/all` desde `0.0.0.0/0`. | Cualquier origen IPv4 puede intentar autenticarse con cualquier usuario y base de datos contemplados por la regla. | Restringir las reglas por origen, base de datos, usuario y método de autenticación. |
| 5 | La aplicación web utiliza una cuenta administrativa. | Si la aplicación se compromete, un atacante podría obtener privilegios excesivos sobre PostgreSQL. | Crear una cuenta de aplicación con los permisos mínimos necesarios. |
| 6 | No existe separación adecuada entre las cuentas administrativas y las de aplicación. | Un incidente en la aplicación puede afectar también las funciones administrativas. | Separar las cuentas DBA, APP y CONSULTA según sus responsabilidades. |
| 7 | Se confía únicamente en la fortaleza de las contraseñas. | Las contraseñas pueden ser robadas, filtradas o utilizadas indebidamente; no limitan los privilegios de una cuenta comprometida. | Combinar autenticación segura con autorización restrictiva, controles de red y monitoreo. |
| 8 | No se restringen suficientemente los orígenes de conexión. | Se facilita que equipos ajenos al entorno autorizado intenten acceder al servicio. | Aplicar reglas coherentes en el firewall y en `pg_hba.conf`. |
| 9 | La configuración permite una exposición innecesaria del servicio. | Aumenta la probabilidad de intentos de acceso no autorizado y explotación de vulnerabilidades. | Revisar y documentar `listen_addresses`, el puerto, las reglas de acceso y los requisitos del sistema. |
| 10 | No se menciona monitoreo ni revisión de eventos de seguridad. | Los intentos de acceso sospechosos o los incidentes pueden pasar inadvertidos. | Configurar registros de conexiones y desconexiones, revisar los eventos y establecer una rutina de supervisión. |
| 11 | No se especifica si las conexiones están protegidas mediante TLS. | Si la conexión no está cifrada, los datos transmitidos pueden quedar expuestos a la observación de terceros en la red. | Evaluar y habilitar TLS cuando corresponda y verificar que las conexiones lo utilicen. |
| 12 | No se menciona la revisión de permisos del sistema operativo. | Usuarios del sistema operativo que no deberían tener acceso podrían leer o modificar archivos sensibles de PostgreSQL. | Restringir los permisos de los archivos de configuración y del directorio de datos. |

### ¿Es suficiente tener contraseñas fuertes?

No. Las contraseñas fuertes son importantes, pero por sí solas no garantizan la seguridad de PostgreSQL. La seguridad depende de varias capas de protección que deben trabajar juntas.


# Actividad 19 — Construcción de una línea base de seguridad para PostgreSQL 16

### Objetivo

Establecer una línea base de seguridad para PostgreSQL 16 que reduzca la exposición de la base de datos, limite los privilegios de los usuarios, proteja la información y facilite la supervisión y el mantenimiento del sistema.

### 1. Red

- **Interfaces autorizadas:** configurar `listen_addresses` para escuchar únicamente en las interfaces necesarias para el funcionamiento del servicio. En la inspección inicial se obtuvo `*`, por lo que se recomienda revisar y limitar este valor.
- **Puerto:** mantener el puerto `5432`, salvo que los requisitos del entorno justifiquen otro.
- **Firewall:** permitir conexiones al puerto 5432 únicamente desde los equipos y redes autorizados. No permitir acceso desde cualquier origen.
- **Redes permitidas:** definir las redes autorizadas según las necesidades reales de administración y aplicación. Denegar conexiones desde orígenes no autorizados.
- **`pg_hba.conf`:** restringir las reglas por dirección de origen, base de datos, usuario y método de autenticación.

### 2. Autenticación

- **Método de autenticación:** utilizar `scram-sha-256` para la autenticación mediante contraseña, verificando la compatibilidad de los clientes.
- **Políticas de credenciales:** utilizar contraseñas robustas, únicas y almacenadas de forma segura. Evitar compartir credenciales entre usuarios y aplicaciones.
- **Cuentas administrativas:** reservar la cuenta `postgres` para tareas administrativas que requieran sus privilegios.
- **Protección de credenciales:** evitar guardar contraseñas en archivos de texto sin protección, código fuente o repositorios compartidos.
- **Estado inicial:** la inspección mostró `password_encryption = scram-sha-256` y reglas visibles de `pg_hba.conf` que utilizan ese método.

### 3. Autorización

- **Roles:** organizar los roles según sus funciones, como administración, aplicación y consulta.
- **Privilegios:** conceder únicamente los permisos necesarios para cada función, siguiendo el principio de mínimo privilegio.
- **Cuentas de aplicación:** utilizar una cuenta específica para cada aplicación o servicio, sin privilegios de superusuario.
- **Cuentas de consulta:** proporcionar permisos de solo lectura sobre las tablas o vistas necesarias.
- **Revisión de roles:** comprobar periódicamente las cuentas, sus permisos, sus membresías y la necesidad de mantenerlas habilitadas.
- **Estado inicial:** se identificó `postgres` como superusuario. Los roles `analista` y `soporte` deben revisarse para confirmar su propósito y uso.

### 4. Configuración

- **Parámetros relevantes:** revisar `listen_addresses`, `port`, `ssl`, `password_encryption`, `max_connections`, `superuser_reserved_connections`, `statement_timeout` e `idle_in_transaction_session_timeout`.
- **Extensiones:** mantener únicamente las extensiones necesarias para la aplicación y las tareas administrativas. Verificar dependencias antes de retirar alguna.
- **Conexiones:** establecer límites apropiados según la capacidad del servidor y las necesidades del sistema.
- **Tiempo de ejecución:** evaluar límites de tiempo para las consultas y las transacciones inactivas, evitando interrumpir operaciones legítimas.
- **Registro de eventos:** evaluar la habilitación de registros de conexiones y desconexiones, y revisar periódicamente los eventos relevantes.
- **Estado inicial:** se observaron `max_connections = 100`, `superuser_reserved_connections = 3`, `statement_timeout = 0` e `idle_in_transaction_session_timeout = 0`. Las extensiones identificadas fueron `pgcrypto` 1.3 y `plpgsql` 1.0.

### 5. Sistema operativo

- **Propietario de archivos:** los archivos de datos y configuración deben pertenecer a la cuenta administrativa del servicio PostgreSQL o a la cuenta designada para administrarlos.
- **Permisos:** restringir la lectura y modificación de archivos sensibles a las cuentas que realmente lo necesiten.
- **Directorio de datos:** proteger el directorio de datos contra el acceso, la modificación y la eliminación no autorizados.
- **Archivos de configuración:** proteger `postgresql.conf`, `pg_hba.conf` y `pg_ident.conf`, ya que sus modificaciones pueden alterar la seguridad del servicio.
- **Estado inicial:** las rutas de los archivos se identificaron, pero sus permisos del sistema operativo todavía deben verificarse.

### 6. Cifrado

- **TLS:** habilitar y configurar TLS cuando corresponda, instalar un certificado válido y comprobar que las conexiones que transportan información sensible estén cifradas.
- **Conexiones cifradas:** establecer las reglas necesarias para exigir conexiones protegidas desde los clientes remotos autorizados.
- **Protección de credenciales:** utilizar `scram-sha-256` y evitar el envío de contraseñas sin cifrado de transporte por redes no confiables.
- **Información sensible:** limitar el acceso a los datos, proteger las copias de seguridad y cifrar la información almacenada cuando los requisitos de seguridad lo indiquen.
- **Estado inicial:** se obtuvo `ssl = off` y `ssl_min_protocol_version = TLSv1.2`. Por tanto, se requiere evaluar la habilitación de TLS y verificar su funcionamiento antes de considerar este control cumplido.

### 7. Mantenimiento

- **Actualizaciones:** mantener PostgreSQL 16 y sus componentes con las actualizaciones de seguridad apropiadas, después de comprobar compatibilidad y realizar pruebas.
- **Revisión periódica:** revisar las cuentas, los privilegios, las reglas de acceso, las extensiones, los registros y los parámetros de configuración.
- **Documentación:** registrar los valores iniciales, los cambios realizados, la justificación de cada cambio y los resultados de las verificaciones.
- **Copias de seguridad:** mantener copias de seguridad protegidas y comprobar periódicamente que puedan restaurarse.
- **Monitoreo:** revisar conexiones, errores de autenticación y eventos sospechosos para identificar posibles incidentes.
- **Control de cambios:** realizar cambios autorizados y documentados, con un procedimiento de verificación y recuperación si aparece algún problema.
