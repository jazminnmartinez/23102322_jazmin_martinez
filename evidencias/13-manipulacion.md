## Actividad 14 — Intentar manipular la auditoría

### 1. ¿Qué evidencia permite detectar que hubo un cambio sin auditar?
La bitácora del servidor registra que el administrador desactivó el disparador, realizó el cambio del RFC y después lo volvió a activar, aunque la tabla de auditoría sigue teniendo tres registros, por lo que se puede detectar que hubo una modificación que no quedó registrada en ella.

### 2. ¿Qué control administrativo (no técnico) reduciría este riesgo?
Establecer que ninguna persona controle por sí sola la base de datos y las evidencias de auditoría, también se deben realizar revisiones independientes y enviar las bitácoras a un área externa encargada de protegerlas.

### 3. Relaciona esta actividad con el principio de separación de funciones de la Unidad II.
Este principio consiste en dividir las responsabilidades para evitar que una sola persona tenga el control de todas las actividades, por ejemplo, el administrador puede operar la base de datos, pero otra persona o área debe encargarse de proteger y revisar las auditorías. 