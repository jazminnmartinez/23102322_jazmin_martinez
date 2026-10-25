# Actividad 8: Derecho de cancelación y ciclo de vida

## 1. Objetivo

Comprender por qué, antes de eliminar los datos personales de un cliente, es necesario revisar dónde más pueden estar almacenados dentro de la organización, como respaldos, réplicas, reportes y sistemas externos.

## 2. Procedimiento

Se analizó qué elementos pueden estar relacionados con la tabla principal cliente e identificaron posibles lugares donde puede existir una copia de los datos personales, tambien se reflexionó sobre por qué eliminar un registro de la tabla principal no garantiza que toda la información haya desaparecido.


## 3. Resultado

**¿Por qué eliminar un registro de una tabla no necesariamente significa que toda la información relacionada con esa persona haya desaparecido de la organización?**

Porque los datos del cliente pueden estar guardados en otros lugares, además de la tabla principal y or ejemplo, pueden existir respaldos, réplicas de la base de datos, reportes, archivos exportados o copias enviadas a sistemas externos. 


## 4. Análisis

Esta actividad demuestra que el derecho de cancelación no consiste solamente en ejecutar una instrucción SQL `DELETE`. Primero se debe revisar el ciclo de vida de los datos y conocer en qué lugares se almacenan o se utilizan.
También se deben considerar los respaldos y los registros de auditoría, ya que pueden tener reglas de conservación diferentes.
## 5. Conclusión

Comprendí que eliminar un dato de la tabla principal no garantiza que desaparezca de toda la organización, porque puede haber copias en otros sistemas, archivos y respaldos.

# Actividad 9: Derecho de oposición

## 1. Objetivo

Comprender cómo atender una solicitud de oposición cuando un cliente pide que sus datos personales dejen de utilizarse para una finalidad secundaria, sin asumir que es necesario eliminar toda su información.

## 2. Procedimiento

Se analizó el caso de un cliente que solicita que sus datos personales dejen de utilizarse para una finalidad secundaria. Después, se identificó qué información podría necesitar conservarse y cuál debería dejar de utilizarse para esa finalidad. También se revisaron algunos mecanismos técnicos, como las vistas y los permisos de acceso, que permiten separar los usos de la información. 

## 3. Resultado

**¿Es necesario eliminar inmediatamente todos sus datos de la base?**

No, la solicitud de oposición se refiere a que los datos no se utilicen para una determinada finalidad, por eso, es posible que algunos datos deban mantenerse para prestar el servicio, realizar la facturación o cumplir con obligaciones aplicables.

**1. ¿Qué información podría necesitar mantenerse?**

Podrían mantenerse el nombre y los datos de contacto necesarios para atender al cliente, así como el RFC y la información fiscal cuando se requieran para facturación o para cumplir con obligaciones aplicables.

**2. ¿Qué información podría dejar de utilizarse para determinada finalidad?**

Podrían dejar de utilizarse para esa finalidad secundaria los datos que se empleaban para enviar promociones personalizadas o realizar análisis individuales, según el alcance de la solicitud y la decisión del área responsable.

**3. ¿Qué mecanismos técnicos podrían separar finalidades?**

- Crear vistas que muestren únicamente los datos necesarios para cada actividad.
- Asignar permisos diferentes según el área y la finalidad.
- Limitar el acceso a los datos utilizados para campañas de marketing.
- Registrar los permisos y los cambios realizados.
- Aplicar controles para evitar que los datos se utilicen para una finalidad no autorizada.

**4. ¿Por qué la decisión final no debe ser tomada únicamente por el DBA?**

Porque el DBA se encarga principalmente de la administración técnica de la base de datos, la decisión también puede depender de las obligaciones legales, las condiciones del tratamiento y las políticas de la organización. Por eso, el área responsable de privacidad y cumplimiento debe evaluar la solicitud, mientras el DBA implementa los controles técnicos necesarios.

## 4. Análisis

El derecho de oposición no significa necesariamente que todos los datos deban eliminarse, es importante distinguir entre conservar información que todavía es necesaria y utilizarla para una finalidad que el cliente ha rechazado.
Los permisos, las vistas y otros controles de acceso pueden ayudar a separar los usos de los datos. 

## 5. Conclusión

El derecho de oposición busca limitar determinados usos de los datos personales y no implica automáticamente eliminar toda la información del cliente, la organización debe evaluar la solicitud y que el DBA puede apoyar mediante permisos, vistas y otros controles técnicos, siguiendo las indicaciones de las áreas responsables.