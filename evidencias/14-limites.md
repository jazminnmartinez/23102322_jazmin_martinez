## Actividad 15 — Límites: lecturas y volumen

### 1. Si clientes tuviera un millón de registros, ¿qué ocurriría con la auditoría tras un UPDATE sin WHERE?
Se modificarían los registros de toda la tabla y el disparador generaría aproximadamente un millón de nuevas filas en la tabla de auditoría, una por cada registro actualizado, esto aumentaría mucho el espacio ocupado y podría afectar el rendimiento de la base de datos.

### 2. Propón quién podría autorizar la depuración de auditoria.cambios_clientes.
La depuración debería ser autorizada por un responsable de seguridad o auditoría, junto con el encargado de protección de datos, el administrador de la base de datos podría realizarla, pero no debería decidir por sí solo qué evidencias eliminar.

### 3. ¿Por qué log_statement = 'all' puede convertir la bitácora en un nuevo depósito de datos sensibles?
Porque registra todas las consultas SQL, incluidas las que leen información privada, como RFC, teléfonos y correos electrónicos, así la bitácora puede almacenar datos sensibles que después podrían quedar expuestos si alguien accede a ella sin autorización. 