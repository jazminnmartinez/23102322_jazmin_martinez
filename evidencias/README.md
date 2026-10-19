## Credenciales
¿Una contraseña debe cifrarse o protegerse mediante un mecanismo de derivación de claves para contraseñas?
Una contraseña debe protegerse mediante un mecanismo de derivación de claves para contraseñas, como bcrypt o Argon2id, y no mediante cifrado reversible. Esto permite verificar si la contraseña ingresada es correcta sin tener que recuperar la contraseña original.

## Datos sensibles
¿Qué diferencia existe entre enmascaramiento, seudonimización y cifrado?
El enmascaramiento consiste en ocultar total o parcialmente los datos para evitar que se visualicen directamente, por ejemplo, mostrar solamente los últimos dígitos de un RFC. La seudonimización consiste en sustituir los datos que identifican directamente a una persona por identificadores alternativos, conservando por separado la información necesaria para relacionarlos con su identidad. El cifrado transforma los datos en una representación ilegible sin la clave correspondiente y permite recuperar la información original mediante el descifrado autorizado.

## Comunicaciones
¿Qué problema resuelve TLS?
TLS protege la información que se transmite entre un cliente y un servidor, como una aplicación y PostgreSQL. Proporciona confidencialidad e integridad, dificultando que terceros puedan leer o modificar los datos durante la transmisión. Además, cuando se valida correctamente el certificado, permite comprobar la identidad del servidor y reducir el riesgo de conectarse a un servidor falso.

## Claves
¿Dónde debería almacenarse una clave criptográfica en un entorno real?
Una clave criptográfica debe almacenarse en un sistema seguro de gestión de claves o en un gestor de secretos, separado del código fuente y de los datos que protege. El acceso debe limitarse únicamente a los usuarios y servicios autorizados. También deben establecerse políticas de rotación, respaldo seguro, recuperación y revocación para evitar la pérdida o exposición de las claves.

## Repositorio
¿Es correcto subir una contraseña o clave real a GitLab aunque el repositorio sea privado?
No es correcto subir contraseñas ni claves criptográficas reales a GitLab, aunque el repositorio sea privado, porque otras personas con acceso al proyecto podrían obtenerlas y utilizarlas sin autorización
