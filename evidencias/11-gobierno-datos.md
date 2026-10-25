# Actividad 11: Diseñar una matriz de gobierno de datos

## 1. Objetivo

Diseñar una matriz de gobierno de datos para identificar la finalidad de los principales campos de la tabla `clientes`, quién es responsable de ellos, qué usuarios pueden acceder, cómo deben protegerse y cuánto tiempo deben conservarse.

## 2. Procedimiento

Se revisaron los campos principales de la tabla `clientes` y se identificó para qué se utiliza cada dato dentro de la organización. Después, se asignaron responsables y usuarios autorizados según las funciones de cada área, también se propusieron medidas de protección, criterios de retención y acciones para cuando los datos dejen de ser necesarios, considerando las obligaciones que puedan aplicar.

## 3. Resultado

| Dato | Finalidad | Responsable | Usuarios autorizados | Protección | Retención | Acción al finalizar |
|---|---|---|---|---|---|---|
| nombre | Identificar al cliente y atender sus solicitudes. | Atención al cliente | Atención al cliente, DBA autorizado | Control de acceso y permisos por rol. | Mientras sea necesario para el servicio y las obligaciones aplicables. | Eliminar o dejar de utilizar cuando corresponda, según las reglas aplicables. |
| correo | Contactar al cliente y responder consultas. | Atención al cliente | Atención al cliente, DBA autorizado | Acceso limitado y protección de la información de contacto. | Mientras sea necesario para la comunicación y las obligaciones aplicables. | Eliminar o dejar de utilizar cuando ya no sea necesario, si no existe una razón válida para conservarlo. |
| telefono | Contactar al cliente cuando sea necesario. | Atención al cliente | Atención al cliente, DBA autorizado | Permisos limitados al personal que lo necesite. | Mientras sea necesario para el servicio y las obligaciones aplicables. | Eliminar o dejar de utilizar cuando corresponda. |
| rfc | Realizar procesos de facturación y cumplir obligaciones fiscales. | Facturación | Facturación, DBA autorizado | Acceso restringido y permisos específicos. | Durante el periodo que corresponda según las obligaciones fiscales y aplicables. | Revisar las obligaciones de conservación antes de eliminarlo. |
| edad | Elaborar estadísticas y análisis por grupos de edad. | Analítica | Analítica mediante datos agrupados, DBA autorizado | Preferir rangos de edad y resultados agregados, sin identificar directamente al cliente. | Mientras sea necesaria para la finalidad autorizada. | Eliminarla o convertirla en información agregada cuando corresponda y sea adecuado. |
| ciudad | Atender necesidades del cliente y analizar información geográfica. | Atención al cliente y Analítica | Atención al cliente para el servicio; Analítica mediante datos agrupados; DBA autorizado | Limitar el acceso y utilizar información agregada para los análisis. | Mientras sea necesaria para la finalidad autorizada y las obligaciones aplicables. | Eliminarla o conservar únicamente resultados agregados cuando corresponda. |
| codigo_postal | Utilizar información de ubicación cuando sea necesaria para el servicio o el análisis. | Atención al cliente y Analítica | Personal que necesite el dato para una función autorizada; DBA autorizado | Acceso restringido y uso de datos agrupados cuando sea posible. | Mientras sea necesario para la finalidad y las obligaciones aplicables. | Eliminarlo o dejar de utilizarlo cuando ya no sea necesario, si no existe obligación de conservarlo. |

## 4. Análisis

La matriz permite observar que no todas las áreas necesitan acceder a todos los datos de los clientes. Por ejemplo, Facturación necesita el RFC para realizar sus funciones, mientras que Analítica puede trabajar con información agrupada por ciudad y rangos de edad sin acceder directamente a nombres, correos o teléfonos.

## 5. Conclusión
Aprendí que los permisos deben asignarse de acuerdo con las funciones de cada área y que la información debe conservarse únicamente durante el tiempo que corresponda.