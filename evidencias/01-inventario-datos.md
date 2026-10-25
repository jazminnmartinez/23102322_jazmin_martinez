# LAB-03 — Actividad 1: Inventario y finalidad de los datos

## 1. Objetivo

Identificar los datos que guarda la empresa Comercializadora Norte S.A. de C.V. y explicar para qué sirve cada uno, si es necesario tenerlo, quién debería poder verlo y durante cuánto tiempo debe conservarse.

## 2. Procedimiento

1. Se revisó la información del laboratorio sobre los datos que guarda la empresa.
2. Se analizó cada campo para identificar si contiene información personal de los clientes.
3. Se indicó para qué se utiliza cada dato dentro de la empresa.
4. Se revisó si cada dato es necesario para realizar las actividades de atención al cliente, facturación y análisis de información.
5. Se propuso quiénes deberían tener acceso a cada dato, dependiendo de su trabajo.
6. Se estableció una propuesta sobre cuánto tiempo se deberían conservar los datos.
7. Se elaboró una tabla con las decisiones tomadas y se explicó por qué se eligió cada una.

## 3. Resultado

### Tabla de inventario de datos

| Campo | ¿Es dato personal? | Finalidad | ¿Es necesario? | Nivel de acceso | Retención |
|---|---|---|---|---|---|
| `id` | Sí, porque puede relacionarse con un cliente. | Identificar cada registro de la base de datos. | Sí, para distinguir a cada cliente. | Atención al cliente, facturación y DBA autorizado. | Mientras el registro sea necesario y durante el tiempo adicional que corresponda. |
| `nombre` | Sí, porque identifica a una persona. | Saber quién es el cliente y atenderlo. | Sí, para atención al cliente y facturación. | Atención al cliente, facturación y DBA autorizado. | Mientras sea necesario para atender al cliente y cumplir las obligaciones aplicables. |
| `correo` | Sí, porque permite identificar o contactar a una persona. | Comunicarse con el cliente. | Sí, cuando sea necesario contactarlo por correo. | Atención al cliente y DBA autorizado; facturación si lo necesita. | Mientras sea necesario para mantener la comunicación. |
| `telefono` | Sí, porque permite contactar a una persona. | Comunicarse con el cliente por teléfono. | Sí, cuando sea necesario para la atención. | Atención al cliente y DBA autorizado. | Mientras sea necesario para contactar al cliente. |
| `rfc` | Sí, cuando corresponde a una persona física identificable. | Realizar los procesos de facturación. | Sí, cuando se necesita para facturar. | Facturación y DBA autorizado. | Durante el tiempo que indiquen las obligaciones fiscales aplicables. |
| `edad` | Sí, porque es información relacionada con una persona. | Obtener estadísticas sobre los clientes. | No siempre; depende de si realmente se necesita. | Acceso limitado; para estadísticas se prefieren datos agrupados. | Solo mientras sea necesaria para el propósito establecido. |
| `ciudad` | Puede serlo si se relaciona con un cliente identificable. | Conocer la ciudad del cliente y realizar estadísticas. | Sí, si se necesita para la atención o para conocer la distribución de los clientes. | Atención al cliente y DBA autorizado; analítica con datos agrupados. | Mientras sea necesaria para su propósito. |
| `codigo_postal` | Sí, cuando se relaciona con un cliente identificable. | Conocer la ubicación del cliente con mayor detalle. | Depende de si se necesita esa información o basta con conocer la ciudad. | Solo las áreas que lo necesiten y el DBA autorizado. | Mientras sea necesario para su propósito. |
| `fecha_alta` | Sí, cuando se relaciona con un cliente identificable. | Saber cuándo se registró el cliente. | Sí, si se necesita para administrar los registros. | Atención al cliente y DBA autorizado; analítica con datos agrupados. | Mientras sea necesaria para administrar los registros y cumplir las obligaciones aplicables. |

### Justificación de cada campo

**1. id**

Es necesario porque permite distinguir a cada cliente dentro de la base de datos. Aunque no muestra directamente su nombre, puede relacionarse con su información, por lo que debe protegerse.

**2. nombre**

Es necesario para saber quién es el cliente y poder atenderlo, también se utiliza en la facturación, pero no es necesario mostrarlo.

**3. correo**

Sirve para comunicarse con los clientes, se debe guardar cuando sea necesario para enviar información o responder solicitudes, no todos los trabajadores necesitan tener acceso a este dato.

**4. telefono**

Permite contactar al cliente cuando se necesita atender una consulta o resolver un problema su acceso debe limitarse a las personas que lo utilizan para realizar su trabajo.

**5. rfc**

Se utiliza principalmente para la facturación y los trámites fiscales que lo requieran. 

**6. edad**

Puede servir para conocer características generales de los clientes, si solo se quieren obtener estadísticas, se pueden agrupar los resultados sin mostrar la edad de cada persona.

**7. ciudad**

Permite conocer dónde viven los clientes y puede ser útil para algunos servicios o estadísticas. 

**8. codigo_postal**

Permite conocer una ubicación más específica que la ciudad. 

**9. fecha_alta**

Sirve para saber cuándo se registró cada cliente y llevar un mejor control de los registros, se pueden agrupar las fechas por mes o año sin mostrar la fecha individual de cada cliente.

## 4. Análisis

Al revisar la tabla, se observa que varios de los datos guardados por la empresa son personales, porque permiten identificar a los clientes o relacionarse con ellos.

También se identificó que no todos los datos se necesitan para las mismas actividades, por ejemplo, el área de atención al cliente necesita información para comunicarse con las personas, mientras que facturación requiere los datos fiscales necesarios. En cambio, el área de analítica puede trabajar con información agrupada sin conocer la identidad de cada cliente.

Por esta razón, es importante que cada trabajador tenga acceso únicamente a los datos que necesita para realizar su trabajo. También se debe revisar cuánto tiempo se guardará cada dato y evitar conservar información que ya no sea necesaria, siempre que no exista una obligación de mantenerla.


## 5. Conclusión

Es importante revisar qué información guarda una empresa y para qué la utiliza, es necesario saber quién puede consultarlos y durante cuánto tiempo deben conservarse.
Además, algunos datos son necesarios para actividades como la atención al cliente y la facturación, mientras que otros pueden ser opcionales dependiendo de las necesidades de la empresa.

# Actividad 2 — Principio de minimización

¿Todos los campos son necesarios para atención al cliente?

No, porque el área de atención al cliente no necesita todos los datos almacenados, para atender a los clientes normalmente son suficientes el identificador, nombre, correo y teléfono. 

¿Por qué soporte necesitaría conocer el RFC?

No lo necesita, porque el RFC se utiliza para los procesos de facturación.

¿Necesita conocer la edad?

No, porque la edad no suele ser indispensable para responder consultas o contactar a los clientes. 

¿Necesita conocer el código postal?

No, si el personal de soporte puede realizar su trabajo sin conocer la ubicación exacta del cliente, no es necesario.

¿Qué principio de privacidad está relacionado con esta decisión?

El principio de minimización de datos, porque consiste en utilizar y guardar únicamente la información necesaria para cumplir una finalidad determinada.

# Actividad 3 — Separación por finalidad

¿Por qué esta información puede ser más apropiada para analítica que entregar directamente la tabla completa de clientes?

Porque el área de analítica necesita conocer datos generales, como la cantidad de clientes por ciudad o por rango de edad, y no necesita identificar a cada persona.

Al utilizar información agrupada, se evita compartir datos como nombres, correos, teléfonos y RFC que no son necesarios para realizar las estadísticas, asi de esta manera, se reduce la exposición de información personal.

# Actividad 4 — Control de acceso relacionado con la finalidad

¿Qué información puede consultar el rol analista?

Puede consultar la información que muestra la vista v_analitica_clientes, que contiene la ciudad y el rango de edad de los clientes, esto permite realizar análisis sin mostrar directamente sus datos de contacto o identificación.

¿Puede consultar directamente la tabla clientes?

No, siempre que no se le hayan otorgado otros permisos que permitan acceder a esa tabla, en el procedimiento propuesto, el rol recibe permiso de consulta únicamente sobre la vista de analítica.

¿Puede obtener nombre, correo y RFC?

No mediante la vista creada, porque esos campos no están incluidos en ella, tampoco puede consultarlos directamente desde la tabla clientes si no tiene permisos adicionales para hacerlo.

¿Qué principio de privacidad estás aplicando?

La limitación de finalidad, porque el acceso a los datos se limita a la información necesaria para realizar las estadísticas, también se aplica la minimización de datos, ya que no se muestran datos personales que no se necesitan para esa actividad.

¿Qué principio de seguridad estás aplicando?

El principio de mínimo privilegio, porque al rol analista se le otorgan solamente los permisos necesarios para realizar su trabajo, sin darle acceso a toda la información de los clientes.