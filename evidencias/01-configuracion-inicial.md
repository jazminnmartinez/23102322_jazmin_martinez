## Actividad 1 — Revisar la configuración de registro por defecto

#### 1. Con esta configuración, ¿se registra quién se conecta?

No, el parámetro log_connections tiene el valor off, por lo que PostgreSQL no registra los intentos de conexión, además, log_disconnections también está en off, así que tampoco registra cuándo termina una sesión.

### 2. ¿Se registran las sentencias UPDATE?

No, el parámetro log_statement tiene el valor none, lo que significa que no se registra ninguna sentencia SQL.

### 3. ¿La línea de bitácora incluye el usuario o la dirección IP del cliente?

No, el parámetro log_line_prefix tiene el valor %m [%p], que únicamente muestra la fecha y hora (%m) y el identificador del proceso (%p)

### 4. ¿En qué zona horaria se registran los eventos? ¿Por qué importa al reconstruir una cronología?

Los eventos se registran en la zona horaria Etc/UTC, según el valor de log_timezone, es importante porque permite ordenar los eventos cronológicamente y compararlos con otros registros. 

### 5. Con logging_collector = off, ¿quién decide dónde termina la bitácora: PostgreSQL o el mecanismo con que se desplegó el servidor?

Lo decide el mecanismo con el que se desplegó o inició el servidor, postgresql envía sus mensajes a la salida de error, pero como logging_collector está en off, no los guarda directamente en sus propios archivos de bitácora. 