# Actividad 12: Privacidad por diseño

## 1. Objetivo

Analizar el diseño de una nueva tabla para registrar clientes e identificar cómo aplicar la privacidad por diseño, evitando almacenar datos personales que no sean necesarios para las funciones de la aplicación.

## 2. Procedimiento

Se revisó la propuesta de la tabla `clientes`, que incluye datos como nombre, correo, teléfono, RFC, edad, dirección, fecha de nacimiento, ocupación, salario y estado civil. Después, se analizaron los posibles problemas de guardar todos estos datos sin conocer su finalidad. 

## 3. Resultado

**¿Qué problemas identificas?**

El principal problema es que se propone almacenar muchos datos personales sin explicar para qué se necesitan, esto puede aumentar los riesgos de exposición, dificultar la protección de la información y hacer que la empresa conserve datos que nunca utilizará. 

**¿Qué principio de privacidad se está ignorando?**

Se está ignorando principalmente el principio de minimización de datos, que consiste en recopilar únicamente la información necesaria para cumplir con una finalidad específica, también se relaciona con la limitación de la finalidad, porque antes de guardar los datos se debe definir para qué se utilizarán.

**¿Qué preguntas realizarías antes de aprobar el diseño?**

Preguntaría para qué se utilizará cada dato, qué funciones de la aplicación necesitan esa información y quién tendrá acceso a ella. También preguntaría si existe una alternativa que permita realizar la misma función utilizando menos datos, cuánto tiempo se conservará la información y si hay obligaciones que justifiquen guardar determinados campos.

**¿Qué datos eliminarías?**

Si la aplicación solamente necesita registrar clientes y permitir el contacto básico, eliminaría inicialmente los campos `salario`, `ocupacion`, `estado_civil` y `fecha_nacimiento`, porque son datos adicionales que no se justifican con la información proporcionada. También revisaría si `direccion`, `edad` y `codigo_postal` son necesarios para el servicio. 

**¿Qué datos requerirían una justificación adicional?**

Los campos `rfc`, `edad`, `direccion`, `ciudad`, `codigo_postal`, `fecha_nacimiento`, `ocupacion`, `salario` y `estado_civil` necesitarían una justificación clara según la finalidad de la aplicación. 

**¿Cómo aplicarías privacidad por defecto?**

Configuraría la aplicación para solicitar únicamente los datos indispensables desde el principio, los campos adicionales no se recopilarían a menos que exista una necesidad justificada, también establecería permisos de acceso según las funciones de cada área, limitaría el acceso a los datos personales y definiría periodos de retención.

## 4. Análisis

La propuesta de guardar todos los datos por si se necesitan después no es una buena práctica, porque no establece una finalidad concreta para cada campo. La privacidad por diseño consiste en considerar la protección de los datos desde la creación de la aplicación, mientras que la privacidad por defecto busca que la configuración inicial limite la recopilación y el acceso a lo estrictamente necesario.

## 5. Conclusión

No es conveniente guardar todos los datos personales solo por si se necesitan en el futuro, antes de diseñar una tabla, es importante definir la finalidad de cada dato y comprobar que realmente sea necesario.

# Actividad 13: Diferenciar controles técnicos y administrativos
| **Medida**                          | **Técnico** | **Administrativo** | **Justificación (si aplica)** |
|-------------------------------------|:-----------:|:------------------:|-------------------------------|
| Crear roles de PostgreSQL           | X           |                    |                               |
| Política de retención                |             | X                  |                               |
| Cifrado de datos                     | X           |                    |                               |
| Procedimiento para solicitudes ARCO |             | X                  |                               |
| Vista con información limitada       | X           |                    |                               |
| Clasificación de información         |             | X                  |                               |
| Registro de auditoría                | X           | X                  | Se necesitan herramientas técnicas para registrar las acciones y procedimientos administrativos para revisar los registros. |
| Política de control de acceso        | X           | X                  | La política establece las reglas de acceso y los permisos técnicos permiten aplicarlas en la base de datos. |


