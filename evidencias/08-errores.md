## Actividad 8 — Errores y operaciones rechazadas

### 1. ¿El intento de soporte_ana causó algún daño? ¿Por qué debe auditarse de todos modos?
No, porque PostgreSQL rechazó la operación al detectar que soporte_ana no tenía permiso para borrar registros, pero debe quedar registrada porque permite saber quién intentó realizar la acción, cuándo lo hizo y qué operación intentó ejecutar.

## 2. ¿Qué diferencia hay entre un error de autorización (esta actividad) y uno de autenticación (Actividad 5)?
El error de autenticación ocurre cuando alguien no logra ingresar a la base de datos, por ejemplo, porque escribió una contraseña incorrecta o usó un usuario que no existe y el error de autorización ocurre cuando alguien sí logró entrar, pero intenta realizar una acción para la que no tiene permiso.

## 3. ¿Qué indica el error de DROP ROLE sobre el orden correcto para dar de baja a un usuario?
Indica que antes de eliminar un usuario se deben quitar los permisos que todavía tenga asignados, primero hay que revisar y retirar sus privilegios sobre las tablas y otros objetos, y después eliminar el rol.