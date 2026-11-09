## Actividad 7 — Modificaciones de datos: ddl frente a mod

### 1. ¿Qué nivel habría registrado la lectura del RFC? ¿Qué costo tendría en un servidor con miles de consultas por minuto?
El nivel all habría registrado también las consultas SELECT, incluyendo la lectura del RFC, en un servidor con miles de consultas por minuto generaría muchísimos registros, ocuparía más espacio y podría afectar el rendimiento de la base de datos.

### 2. ¿Qué le falta a esta bitácora para revertir el cambio con certeza?
Le falta guardar el valor que tenía el dato antes de ser modificado, la bitácora muestra la sentencia ejecutada y el valor nuevo, pero no conserva el valor anterior del teléfono, por eso, no se puede saber con certeza qué valor había antes ni restaurarlo. 