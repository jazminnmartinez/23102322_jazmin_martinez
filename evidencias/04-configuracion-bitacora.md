## Actividad 4 — Configurar la bitácora

### 1. ¿Por qué el proceso que registra el cambio es el principal y no tu sesión?
Porque los cambios se aplican directamente al servidor PostgreSQL cuando se recarga la configuración, por eso, el proceso principal es quien detecta y registra los cambios, no la sesión desde la que se ejecutaron los comandos.

### 2. ¿Qué pasaría si alguien ejecutara ALTER SYSTEM SET log_statement = 'none'? ¿Quedaría rastro?
PostgreSQL dejaría de registrar las sentencias SQL, al recargar la configuración podría quedar un registro indicando que log_statement cambió a none, después de eso, las siguientes sentencias ya no quedarían registradas en la bitácora.

### 3. ¿Por qué no se recomienda editar postgresql.auto.conf a mano?
Porque ese archivo lo administra PostgreSQL y se modifica mediante ALTER SYSTEM, si alguien lo edita directamente, puede cometer errores o provocar problemas con la configuración. 