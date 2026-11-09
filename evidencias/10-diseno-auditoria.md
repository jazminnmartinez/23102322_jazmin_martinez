## Actividad 11 — Crear la función y el disparador

| Campo propuesto | Tipo | ¿Qué pregunta responde? | ¿Puede ser nulo? ¿Por qué? |
|---|---|---|---|
| id_evento | BIGSERIAL | ¿Cuál es el número único de este evento? | No, porque identifica cada registro de auditoría. |
| momento | TIMESTAMPTZ | ¿Cuándo ocurrió el cambio? | No, porque es necesario conocer la fecha y hora de cada evento. |
| usuario_sesion | TEXT | ¿Con qué usuario inició sesión la persona? | No, porque permite identificar quién se conectó a la base de datos. |
| usuario_efectivo | TEXT | ¿Con qué usuario se ejecutó realmente la operación? | No, porque ayuda a identificar qué usuario tenía los permisos al realizar el cambio. |
| aplicacion | TEXT | ¿Desde qué aplicación se realizó la operación? | Sí, porque algunas conexiones pueden no indicar el nombre de una aplicación. |
| ip_cliente | INET | ¿Desde qué dirección IP se realizó la conexión? | Sí, porque las conexiones locales mediante socket no tienen una dirección IP. |
| operacion | TEXT | ¿Qué tipo de cambio se realizó (INSERT, UPDATE o DELETE)? | No, porque es necesario saber qué acción ocurrió. |
| id_cliente | BIGINT | ¿Qué cliente fue afectado? | Sí, porque no todos los eventos necesariamente tienen un cliente relacionado. |
| valores_antes | JSONB | ¿Qué información tenía el cliente antes del cambio? | Sí, porque en una operación INSERT todavía no existen valores anteriores. |
| valores_despues | JSONB | ¿Cómo quedó la información del cliente después del cambio? | Sí, porque en una operación DELETE ya no existen valores posteriores. |

### 1. ¿Por qué momento usa TIMESTAMPTZ y no TIMESTAMP?
Porque TIMESTAMPTZ permite manejar correctamente las zonas horarias, así es más fácil comparar los registros aunque se hayan generado desde diferentes lugares o servidores.

### 2. ¿Por qué se guarda el registro completo en JSONB y no solo la columna que cambió?
Porque permite conservar toda la información del cliente antes y después de una modificación, esto facilita revisar qué cambió y recuperar los datos anteriores si ocurre algún problema, luego si la tabla cambia de estructura, el registro de auditoría sigue conservando la información guardada.

### 3. La tabla de auditoría también contendrá RFC. ¿Qué implica eso para su clasificación y su control de acceso?
Significa que la tabla contiene información sensible de los clientes y debe protegerse adecuadamente, solo el administrador y el personal autorizado para realizar auditorías deberían poder consultarla. 