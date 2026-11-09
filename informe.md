### 1. ¿Por qué la auditoría no puede configurarse después de un incidente para investigarlo?
Porque la auditoría necesita estar activada antes de que ocurran los incidentes. Si no se registraron las conexiones o los cambios realizados, no hay evidencia suficiente para saber quién hizo una modificación, cuándo ocurrió o qué información cambió.

### 2. ¿Por qué conviene que la bitácora la administre el propio servidor y no el mecanismo de despliegue?
Porque PostgreSQL puede controlar directamente sus registros y aplicar su configuración de auditoría. Esto permite administrar mejor qué información se guarda y facilita su consulta. El mecanismo de despliegue puede encargarse de ejecutar o iniciar el servidor, pero no debería ser el único responsable de conservar las evidencias.

### 3. ¿Por qué el prefijo de línea es tan importante como el nivel de log_statement?
Porque log_statement determina qué consultas se registran, mientras que el prefijo permite identificar información sobre quién ejecutó la consulta, en qué base de datos, desde qué aplicación y dirección IP, además de la fecha y hora. Ambos son necesarios para investigar correctamente un evento.

### 4. ¿Qué diferencia práctica hay entre registrar la sentencia y registrar el cambio en el dato?
Registrar la sentencia permite conocer qué instrucción SQL se ejecutó, por ejemplo, un UPDATE. En cambio, registrar el cambio en el dato permite conocer cómo estaba la información antes y cómo quedó después de la modificación. La segunda opción facilita identificar exactamente qué valores fueron modificados.

### 5. ¿Qué evidencia ofrece pg_stat_activity que no ofrece la bitácora, y viceversa?
pg_stat_activity muestra información de las conexiones y consultas que están activas en ese momento, como el usuario, la base de datos y el estado de la sesión. La bitácora conserva registros de eventos que ya ocurrieron, incluso después de que la conexión haya terminado. Por eso, ambas herramientas se complementan.

### 6. Si el administrador puede cambiar log_statement a none y desactivar el disparador, ¿quién audita al administrador?
Debe hacerlo un área independiente de auditoría o seguridad, que no dependa directamente del administrador de la base de datos. Para ello, las bitácoras deben enviarse a un sistema externo protegido, donde el administrador no tenga permisos para modificarlas o eliminarlas.

### 7. ¿Qué importancia tiene la auditoría para la seguridad de una base de datos?
La auditoría permite llevar un registro de las actividades realizadas en la base de datos, identificar cambios, detectar accesos sospechosos y conocer posibles errores o intentos de manipulación. También ayuda a investigar incidentes y comprobar que los usuarios cumplen con sus permisos y responsabilidades. Es una parte importante de la seguridad porque permite tener evidencia de lo que sucede dentro del sistema.