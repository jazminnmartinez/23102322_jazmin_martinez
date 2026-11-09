## Actividad 9 — Sesiones activas con pg_stat_activity

### 1. ¿Qué columna permite relacionar una sesión con sus líneas de bitácora?
La columna pid, porque muestra el identificador del proceso de cada sesión, ese mismo número aparece en la bitácora, así que permite relacionar una conexión con sus registros.

### 2. Después de que termina el reporte, ¿qué fuente conserva evidencia de que existió?
La bitácora conserva la evidencia, porque registra información de la conexión, las consultas y la desconexión, pg_stat_activity muestra principalmente las sesiones que están activas en ese momento, por lo que, al terminar el reporte, esa sesión ya no aparece.

### 3. ¿Por qué client_addr aparece vacío en la sesión del administrador?
Porque el administrador se conectó mediante una conexión local, usando un socket del servidor en lugar de una conexión por red, por eso PostgreSQL no muestra una dirección IP en client_addr.