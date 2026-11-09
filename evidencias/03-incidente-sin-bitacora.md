## Actividad 3 — El incidente sin bitácora

### 1. ¿Puedes demostrar quién modificó el RFC?
No, aunque sabemos que el RFC fue modificado, no podemos demostrar quién lo hizo porque la bitácora no guardó información sobre esa operación ni sobre la conexión de app_ventas.

### 2. ¿Puedes demostrar que el cambio no lo hizo soporte_ana?

No, como no hay registros de las actividades realizadas, tampoco podemos asegurar que soporte_ana no haya hecho el cambio. 

### 3. Los privilegios de la Unidad II, ¿impidieron el cambio? ¿Debían impedirlo?

No, porque el usuario app_ventas tenía permiso para modificar los datos de la tabla clientes, esos permisos no impidieron el cambio, no debían impedirlo, ya que la aplicación de ventas necesitaba actualizar información. 

### 4. ¿Qué tendría que haber estado configurado antes del incidente?

Se tenía que haber activado el registro de conexiones y de las modificaciones realizadas en la base de datos, también era necesario configurar la bitácora para guardar el usuario, la dirección IP y la aplicación desde donde se hizo el cambio.

