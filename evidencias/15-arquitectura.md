# Actividad 15: Propuesta de arquitectura de datos protegidos

## 1. Objetivo

Diseñar una propuesta conceptual de arquitectura de datos que permita separar la información de los clientes según su finalidad, aplicando controles de acceso, minimización, protección de información sensible, retención, trazabilidad, eliminación y atención de solicitudes.

## 2. Procedimiento

Se propuso dividir el acceso a la información en tres áreas: Operación, Analítica y Auditoría. Cada área tendrá acceso únicamente a los datos necesarios para cumplir sus funciones. También se plantearon controles para proteger los datos personales, establecer periodos de conservación, registrar las acciones realizadas y atender las solicitudes de los clientes. 

## 3. Resultado

### Controles propuestos

| Control | Aplicación en la arquitectura | Finalidad |
|---|---|---|
| Acceso | Crear roles y permisos diferentes para Operación, Analítica y Auditoría. | Evitar que los usuarios consulten información que no necesitan. |
| Minimización | Mostrar a cada área únicamente los campos necesarios para sus funciones. | Reducir la cantidad de información personal expuesta. |
| Protección de información sensible | Restringir el acceso al RFC y otros datos personales que requieran protección especial; aplicar medidas de seguridad adecuadas. | Prevenir accesos y usos no autorizados. |
| Retención | Definir plazos de conservación según la finalidad y las obligaciones aplicables. | Evitar conservar información más tiempo del necesario. |
| Trazabilidad | Registrar accesos, modificaciones, consultas relevantes y acciones administrativas. | Permitir revisar las actividades y detectar posibles irregularidades. |
| Eliminación | Establecer procedimientos para eliminar o dejar de utilizar datos cuando corresponda, considerando obligaciones de conservación y copias existentes. | Evitar que la información innecesaria permanezca almacenada sin justificación. |
| Atención de solicitudes | Establecer un procedimiento para recibir, verificar y atender solicitudes de acceso, rectificación, cancelación u oposición. | Respetar los derechos de los clientes y documentar las acciones realizadas. |

### Funciones de cada área

| Área | Información que puede utilizar | Restricciones |
|---|---|---|
| Operación | Nombre, correo, teléfono y otros datos necesarios para atender al cliente. | No debe acceder a información que no necesite para prestar el servicio. |
| Analítica | Datos agrupados por ciudad, rangos de edad y estadísticas de clientes. | Debe evitar acceder directamente a identificadores personales cuando no sean necesarios. |
| Auditoría | Registros de accesos, modificaciones y actividades relevantes. | Debe tener permisos restringidos y utilizar la información únicamente para fines de revisión y control. |

## 4. Análisis

Separar la información por finalidad permite que cada área trabaje con los datos necesarios sin tener acceso general a toda la base de datos. Por ejemplo, Analítica puede generar estadísticas mediante información agrupada, mientras que Operación puede consultar los datos de contacto necesarios para atender a los clientes.

Auditoría permite revisar las actividades realizadas y verificar que se respeten los permisos establecidos. Además, los controles de retención, eliminación y atención de solicitudes ayudan a administrar los datos durante todo su ciclo de vida. Estos controles deben documentarse y revisarse periódicamente para comprobar que siguen siendo adecuados.

## 5. Conclusión

Una arquitectura de datos protegidos debe organizar la información de acuerdo con su finalidad y limitar el acceso según las responsabilidades de cada área, también aprendí que la privacidad no depende de un solo control, sino de combinar permisos, minimización, protección de información sensible, retención, trazabilidad, eliminación y atención de solicitudes. Esta propuesta permite establecer una base conceptual para administrar los datos de forma más segura y responsable.