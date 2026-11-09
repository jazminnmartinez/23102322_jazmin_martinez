## Actividad 2 — Que el servidor administre su propia bitácora

### 1. ¿Por qué logging_collector requiere reinicio y log_statement solo recarga?
Porque logging_collector necesita que PostgreSQL inicie un proceso para encargarse de guardar los registros en archivos, por eso es necesario reiniciar el servidor para que el cambio funcione, log_statement solo cambia qué consultas se guardan, así que basta con recargar la configuración sin tener que apagar y volver a iniciar el servidor.

### 2. ¿Qué ventaja tiene que la bitácora se lea con SQL y no con una herramienta del sistema operativo o del contenedor? ¿Qué riesgo introduce?
La ventaja es que se puede consultar la bitácora directamente desde PostgreSQL, sin tener que buscar el archivo manualmente ni usar otras herramientas. Esto hace más fácil revisar los registros y encontrar información específica.

El riesgo es que no cualquier usuario debería tener acceso, porque la bitácora puede contener información privada o importante, si alguien sin autorización puede leerla, podría obtener datos que no debería conocer.

### 3. ¿Quién debería poder consultar dba.bitacora?

Principalmente el administrador de la base de datos y el personal autorizado para revisar la seguridad o las auditorías, no debería estar disponible para todos los usuarios, porque contiene información sobre las conexiones y actividades realizadas en el servidor.