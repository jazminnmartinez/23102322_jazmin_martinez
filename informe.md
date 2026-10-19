# Informe de protección y privacidad de los datos
## Laboratorio 01
//JAZMIN GUADALUPE MARTINEZ CAMACHO
// GRUPO 4-1

### 19.1 Clasificación
Los campos que requieren protección y pueden identificar directamente a una persona son principalmente el nombre, el correo electrónico, el teléfono y el RFC. 

La edad, la ciudad, el código postal y la fecha de alta pueden funcionar como cuasi-identificadores. Aunque por separado no siempre permiten reconocer a una persona, su combinación puede reducir las posibilidades de identificación. No todos estos datos son datos personales sensibles. Sin embargo, sí pueden ser datos personales o información confidencial que requiere medidas de protección.

### 19.2 Enmascaramiento
 Se creó el rol soporte y la vista v_clientes_soporte. La vista presenta una versión parcialmente oculta de esos campos, mientras que la tabla original conserva sus valores.
El correo electrónico muestra solamente una parte del inicio y el dominio. El teléfono presenta únicamente los últimos cuatro dígitos y el RFC oculta la mayor parte de su contenido. Este mecanismo permite que el personal de soporte consulte información útil para atender solicitudes sin tener que visualizar todos los datos originales. También se otorgó permiso de consulta sobre la vista y se retiró al rol el acceso directo a la tabla clientes.

### 19.3 Seudonimización
La seudonimización se planteó para permitir que el área de analítica trabaje con información de clientes sin consultar directamente sus nombres, correos electrónicos, teléfonos o RFC.
Para ello se crearon los esquemas pii y analitica. En el esquema pii se definió la tabla mapa_cliente, que relaciona cada token con el identificador original del cliente.

Los tokens se generaron utilizando la extensión pgcrypto. Después se creó la tabla analitica.clientes, que contiene los tokens y algunos datos necesarios para el análisis, como la edad, la ciudad, el código postal y la fecha de alta. De esta manera, conocer un token no permite identificar directamente al cliente sin consultar información adicional.

### 19.4 Anonimización
Se utilizaron consultas de agrupación para generalizar las edades y reducir el detalle de los códigos postales. También se combinaron ambos atributos para observar cómo puede cambiar el riesgo de identificación cuando se utilizan varias características al mismo tiempo.
En la generalización de la edad se utilizaron los rangos de 18 a 30 años, de 31 a 45 años y de 46 años en adelante. Para la región postal se tomaron los dos primeros caracteres del código postal.

Los identificadores directos, como el nombre, el correo electrónico, el teléfono y el RFC, no se incluyen en las consultas estadísticas. Aun así, permanecen algunos cuasi-identificadores, como la edad generalizada y la región postal. Si se combinan estos datos con información externa, todavía podría existir un riesgo de reidentificación. Por ejemplo, un grupo con muy pocos registros o con características poco comunes podría permitir distinguir a una persona.

Para reducir ese riesgo se puede generalizar más la información, agrupar las regiones en categorías más amplias o suprimir determinados resultados cuando los grupos sean demasiado pequeños. Cuando un grupo contiene pocos registros, aumenta la posibilidad de que una persona pueda ser reconocida a partir de sus características. Por ello, conviene revisar el tamaño de los grupos antes de publicar información estadística.

Una medida para reducir el riesgo consiste en ampliar los rangos de edad, utilizar regiones menos específicas y evitar publicar resultados correspondientes a grupos demasiado pequeños.
.
### 19.5 Retención
La retención de datos permite establecer durante cuánto tiempo debe conservarse la información de acuerdo con su finalidad, las necesidades de la organización y las obligaciones aplicables.

En esta práctica se utilizó una consulta para identificar los registros cuya fecha de alta es anterior a los últimos cinco años.

La consulta permite localizar los registros que podrían superar el periodo de conservación establecido para el ejercicio. No obstante, superar cinco años no significa que los datos deban eliminarse automáticamente.
Antes de eliminar información, la organización debe justificar el periodo de conservación, comprobar si existen obligaciones legales o contractuales y obtener la aprobación correspondiente.

También es importante contar con respaldos adecuados, registrar las autorizaciones y conservar evidencia del procedimiento realizado. En caso de una eliminación accidental, debe existir un procedimiento de recuperación mediante respaldos cuando corresponda.

La conservación indefinida de información innecesaria puede incrementar los riesgos de seguridad y privacidad, por lo que es importante revisar qué datos deben mantenerse y cuáles pueden eliminarse de forma segura.

### 19.6 Conclusiones

1. ¿Qué técnica utilizarías para un área de soporte?
Utilizaría el enmascaramiento de datos mediante una vista, porque permite consultar la información necesaria para atender a los clientes sin mostrar completamente sus datos personales.

2. ¿Qué técnica utilizarías para un área de analítica?
Utilizaría la seudonimización, porque permite analizar los datos usando identificadores sustitutos en lugar de mostrar directamente la identidad de los clientes.

3. ¿Qué técnica utilizarías para publicar estadísticas?
Utilizaría la anonimización mediante la agrupación y generalización de los datos, evitando publicar grupos muy pequeños que puedan facilitar la identificación de una persona.

4. ¿Por qué ninguna de estas técnicas sustituye al control de acceso?
Porque estas técnicas ayudan a proteger la información, pero no impiden por sí solas que una persona consulte datos para los que no tiene autorización. Por eso es necesario establecer permisos adecuados en la base de datos.

 ### 20. Preguntas de reflexión
 1. ¿Cuál es la diferencia entre enmascaramiento y seudonimización?

El enmascaramiento oculta una parte del dato cuando se muestra al usuario, pero el valor original permanece almacenado. La seudonimización sustituye un identificador por otro, como un token, y mantiene separada la información que permite relacionarlo nuevamente con la persona.

2. ¿Por qué la seudonimización no significa anonimización?

Porque todavía existe información adicional que permite recuperar la relación entre el token y la persona. Si alguien obtiene acceso al mapa de correspondencia, puede relacionar los datos seudonimizados con los clientes originales.

3. ¿Por qué eliminar nombre y RFC no garantiza que un conjunto de datos sea anónimo?

Porque otros datos, como la edad, la ciudad y el código postal, pueden combinarse para distinguir a una persona. También puede existir información externa que facilite relacionar los registros con alguien identificado.

4. ¿Qué función tienen los cuasi-identificadores?

Son datos que por sí solos no siempre identifican directamente a una persona, pero que pueden contribuir a reconocerla cuando se combinan con otros atributos. Por eso deben considerarse al reducir el riesgo de reidentificación.

5. ¿Por qué es importante separar el mapa de seudonimización?

Porque el mapa contiene la relación entre los tokens y los identificadores originales. Si se mantiene separado y con permisos más estrictos, se reduce la posibilidad de que una persona sin autorización pueda conocer la identidad de los clientes.

6. ¿Qué principio de seguridad se aplica al impedir que el analista acceda al mapa?

Se aplica el principio de mínimo privilegio. El analista recibe únicamente los permisos necesarios para consultar los datos destinados al análisis, sin acceder a información que no necesita para su función.

7. ¿Por qué una vista puede ser preferible a entregar acceso directo a la tabla?

Porque una vista permite seleccionar qué columnas se muestran y aplicar transformaciones, como el enmascaramiento. Así, el usuario puede consultar la información que necesita sin recibir acceso directo a todos los datos originales.

8. ¿Qué diferencia existe entre proteger un dato para visualización y protegerlo contra acceso no autorizado?

Proteger la visualización significa mostrar una versión limitada u oculta del dato. Protegerlo contra el acceso no autorizado implica establecer permisos que impidan consultar o modificar la información original sin autorización. Ambas medidas deben complementarse.

9. ¿Por qué la retención forma parte de la protección de datos?

Porque establece cuánto tiempo debe conservarse la información y ayuda a evitar que permanezcan almacenados datos que ya no son necesarios. 

10.  ¿Qué riesgo existe si una organización conserva información indefinidamente?

Puede acumular información innecesaria y aumentar el impacto de una filtración o de un acceso no autorizado. 