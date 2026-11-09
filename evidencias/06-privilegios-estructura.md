## Actividad 6 — Cambios de privilegios y de estructura

### 1. ¿Qué tipo de evento es cada una de las tres primeras sentencias (privilegio o estructura)?
- REVOKE UPDATE ON clientes FROM soporte_ana: es un cambio de privilegios, porque quita el permiso para actualizar la tabla.
- GRANT UPDATE ON clientes TO app_ventas: es un cambio de privilegios, porque concede el permiso para actualizar la tabla.
- ALTER TABLE clientes ADD COLUMN segmento VARCHAR(20): es un cambio de estructura, porque agrega una nueva columna a la tabla clientes.
### 2. ¿Por qué GRANT y REVOKE quedan registrados con log_statement = 'ddl'?
Porque GRANT y REVOKE son comandos que modifican los permisos de los usuarios, postgresql los considera parte de los cambios administrativos de la base de datos, por eso los registra cuando está activada la opción ddl.

### 3. Si la bitácora contiene contraseñas, ¿quién debería poder leerla? Relaciónalo con la gestión de secretos de la Unidad II.
Solamente el administrador de la base de datos y el personal autorizado que se encargue de las auditorías o la seguridad deberían poder leerla, las contraseñas son información privada y no deben estar al alcance de cualquier usuario.

Esto se relaciona con la gestión de secretos de la Unidad II porque las contraseñas deben mantenerse protegidas y no escribirse directamente en comandos que puedan quedar guardados en la bitácora.