# Actividad 14: Escenario integral

## 1. Objetivo

Identificar los problemas de privacidad y gobierno de datos en Comercializadora Norte S.A. de C.V., relacionarlos con los principios afectados y proponer controles para proteger la información de los clientes.

## 2. Procedimiento

Se revisaron las situaciones del caso para identificar los riesgos relacionados con el acceso a los datos, el uso de información personal, el tiempo de conservación y las copias utilizadas por los desarrolladores. Después, se relacionó cada problema con el principio afectado y se propuso un control para reducir los riesgos y mejorar la protección de la información.

## 3. Resultado

| Problema identificado | Principio afectado | Riesgo | Control propuesto |
|---|---|---|---|
| El personal de Analítica accede directamente a la tabla `clientes`. | Minimización y control de acceso. | Puede consultar información que no necesita para sus funciones. | Crear una vista limitada y asignar permisos mediante roles. |
| El personal de Analítica puede ver nombres, correos y teléfonos. | Minimización de datos. | Se expone información personal innecesaria para los análisis. | Utilizar datos agrupados o resultados que no identifiquen a los clientes. |
| El personal de Analítica puede consultar el RFC. | Minimización y limitación de la finalidad. | Se expone información fiscal que podría no ser necesaria. | Restringir el RFC al personal autorizado que lo necesite. |
| Los datos se conservan durante 12 años. | Limitación del plazo de conservación. | Se puede mantener información durante más tiempo del necesario. | Revisar las necesidades y establecer plazos de conservación justificados. |
| No existe una política de retención. | Responsabilidad y limitación de la conservación. | Los datos podrían conservarse indefinidamente. | Documentar una política de retención con plazos y responsables. |
| Los desarrolladores reciben copias completas de la base de datos. | Minimización y confidencialidad. | Se amplía la exposición de la información personal. | Proporcionar únicamente los datos necesarios para el desarrollo. |
| Las copias de desarrollo contienen datos reales. | Privacidad desde el diseño y seguridad. | La información puede quedar expuesta en entornos menos controlados. | Utilizar datos ficticios o anonimizados cuando sea posible. |
| Mercadotecnia utiliza correos para promociones sin una finalidad documentada. | Limitación de la finalidad y transparencia. | El uso de los datos podría no estar debidamente justificado o informado. | Revisar la finalidad, las condiciones aplicables y el aviso de privacidad. |
| No están documentadas claramente las finalidades del uso de los datos. | Limitación de la finalidad y responsabilidad. | La información puede utilizarse sin una justificación clara. | Documentar las finalidades y las áreas autorizadas para cada uso. |
| No se especifica el acceso según el tipo de información. | Confidencialidad y control de acceso. | Los usuarios podrían consultar datos que no necesitan. | Implementar roles y permisos de acuerdo con las funciones de cada usuario. |
| No se mencionan revisiones periódicas de los accesos. | Seguridad y responsabilidad. | Los permisos inadecuados podrían mantenerse sin ser detectados. | Revisar los permisos periódicamente y conservar registros de auditoría. |
| No se revisa si los datos siguen siendo necesarios. | Minimización y limitación de la conservación. | Se acumulan datos que ya no son necesarios. | Realizar revisiones periódicas y documentar las decisiones de conservación. |

## 4. Análisis

Los problemas identificados muestran que la empresa necesita mejorar la forma en que recopila, utiliza, comparte y conserva la información personal. El acceso directo a la base de datos y el uso de copias completas aumentan el riesgo de exposición. Además, conservar información durante muchos años sin una política definida puede provocar que se mantengan datos que ya no son necesarios.

Para reducir estos riesgos, la empresa debe establecer permisos según las funciones de cada empleado, utilizar vistas con información limitada, definir plazos de conservación y documentar las finalidades de uso. 

## 5. Conclusión

La privacidad y el gobierno de datos son importantes para proteger la información de los clientes, cada usuario debe acceder únicamente a los datos que necesita, que las finalidades deben estar documentadas y que la información no debe conservarse más tiempo del necesario. Aplicar estos controles permite reducir riesgos y administrar los datos de forma más segura y responsable.