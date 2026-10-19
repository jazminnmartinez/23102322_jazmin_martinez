# Actividad 10 — Política de protección de claves criptográficas

## Objetivo
Establecer reglas básicas para proteger las claves criptográficas durante todo su ciclo de vida.

## Política

1. **Generación:** las claves se generarán mediante herramientas criptográficas confiables y métodos aleatorios seguros. No se utilizarán claves predecibles ni valores de prueba en producción.

2. **Almacenamiento:** las claves se guardarán en un sistema seguro de gestión de secretos o de claves, separado del código fuente y de los datos que protegen.

3. **Acceso:** solamente los usuarios y servicios autorizados podrán utilizar las claves necesarias para sus funciones. Se aplicará el principio de mínimo privilegio.

4. **Rotación:** se establecerá un calendario de rotación y se cambiarán las claves cuando exista sospecha de exposición o cuando lo exijan las políticas de seguridad.

5. **Respaldo:** las claves necesarias para recuperar información se respaldarán mediante procedimientos seguros, con acceso restringido y pruebas controladas de recuperación.

6. **Revocación:** cuando una clave se comprometa, deje de ser necesaria o deba retirarse, se revocará o deshabilitará según el mecanismo utilizado y se evaluará el impacto sobre los datos protegidos.

7. **Exposición accidental:** si una clave aparece en un repositorio, registro o archivo público, se notificará al responsable de seguridad, se considerará comprometida y se aplicará el procedimiento de respuesta correspondiente.

8. **Eliminación:** las claves que ya no sean necesarias se eliminarán mediante procedimientos adecuados al sistema de almacenamiento y a los requisitos de conservación.

9. **Auditoría:** se registrará y revisará el acceso a las claves cuando las herramientas utilizadas lo permitan, evitando almacenar las claves en los registros.

## Conclusión
Una clave criptográfica requiere protección durante su generación, almacenamiento, utilización y eliminación. Un algoritmo seguro no puede compensar una clave expuesta o administrada incorrectamente.