##  Actividad 11 — Crear la función y el disparador

### 1. ¿Por qué se ejecuta REVOKE ALL ON FUNCTION ... FROM PUBLIC si el disparador seguirá funcionando para app_ventas?
Porque se busca evitar que cualquier usuario pueda ejecutar la función directamente, el disparador puede seguir funcionando cuando app_ventas realiza cambios en la tabla, ya que postgresql ejecuta la función automáticamente. +

### 2. ¿Qué pasaría si la función no fuera SECURITY DEFINER? Formula una hipótesis antes de la Actividad 12.
Mi hipótesis es que la función se ejecutaría con los permisos del usuario que realiza el cambio, en este caso app_ventas, como ese usuario no tiene permisos para insertar registros en la tabla de auditoría, el cambio podría generar un error y no completarse.

### 3. Consulta dba.bitacora. ¿Quedó registrada la creación del esquema, la tabla, la función y el disparador? ¿Por qué?
Sí, deberían quedar registradas las sentencias de creación del esquema, la tabla, la función y el disparador, porque son cambios en la estructura de la base de datos y como log_statement está configurado en ddl, postgresql registra ese tipo de comandos.

## Actividad 12 — El incidente auditado

### 1. Compara tu hipótesis de la Actividad 11 con este resultado.
Mi hipótesis fue correcta, porque la función SECURITY DEFINER permitió que la auditoría se ejecutara con los permisos de su propietario, que es postgres. Aunque app_ventas realizó el cambio, quedó registrado como usuario_sesion. 

### 2. Escribe la sentencia UPDATE que restauraría el valor anterior.
UPDATE clientes
SET rfc = 'GAMA780912XYZ'
WHERE id = 3;

### 3. ¿Qué columna conserva más valor para una investigación: aplicacion o ip_cliente? ¿Cuál puede falsificar el cliente con más facilidad?
La columna ip_cliente aporta información sobre la dirección desde donde se realizó la conexión, la columna aplicacion también es útil para identificar el programa utilizado, pero puede falsificarse más fácilmente porque el propio cliente puede elegir el nombre de la aplicación. 