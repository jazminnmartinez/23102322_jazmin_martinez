## Actividad 19 — Auditoría de objeto sobre columnas sensibles

### 1. ¿Por qué no apareció SELECT nombre, ciudad ...? ¿Por qué sí apareció SELECT * ...?
La primera consulta no apareció porque solo accede a las columnas nombre y ciudad, que no están incluidas en los privilegios del rol auditor_datos.

En cambio, SELECT * sí apareció porque consulta todas las columnas de la tabla, incluyendo rfc y telefono, que son las columnas sensibles configuradas para la auditoría.

### 2. ¿Por qué no apareció UPDATE ... ciudad ...?
Porque la columna ciudad no está incluida en los privilegios del rol auditor_datos. La auditoría de objeto está configurada para registrar operaciones sobre las columnas rfc y telefono, por lo que el cambio de ciudad no queda registrado por este mecanismo.

### 3. ¿Qué diferencia de volumen esperarías frente a log_statement = 'all'?
Con pgaudit en modo de objeto se espera un menor volumen de registros, porque solo se registran las operaciones sobre los objetos y columnas seleccionados. En cambio, log_statement = 'all' registra todas las consultas SQL, incluso las que no modifican información sensible, por lo que genera muchos más registros.

### 4. El README oficial advierte que pgaudit no puede auditar de forma confiable a los superusuarios. ¿Qué implica para la separación de funciones?
Implica que no se debe depender únicamente de pgaudit para vigilar las acciones de los superusuarios. Es necesario separar responsabilidades: una persona puede administrar PostgreSQL, mientras otra área independiente se encarga de proteger y revisar las bitácoras. Así se evita que quien administra la base de datos tenga también el control total de las evidencias de auditoría.