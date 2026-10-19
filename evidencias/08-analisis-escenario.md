# Actividad 08 — Análisis de un escenario de seguridad

### Objetivo
Identificar riesgos de seguridad relacionados con credenciales, datos sensibles, comunicaciones, claves criptográficas y respaldos.

### ¿Cuáles son los principales riesgos?

Los principales riesgos son:

1. **Contraseñas en texto claro:** cualquier persona que obtenga acceso de lectura a la tabla podría conocer las contraseñas.
2. **RFC en texto claro:** una filtración o consulta no autorizada podría exponer información personal.
3. **Conexiones sin validación adecuada del servidor:** existe riesgo de conectarse a un servidor impostor y de exponer información durante la comunicación.
4. **Claves en archivos SQL:** las claves podrían quedar expuestas en repositorios, historial de Git, registros o copias de los archivos.
5. **Respaldos sin protección:** una persona que obtenga un archivo de respaldo podría acceder a la información que contiene.

### ¿Qué mecanismo utilizarías para cada elemento?
Para el nombre y el correo electrónico, aplicaría controles de acceso y minimización de datos, además de cifrado cuando sea necesario. Para las contraseñas, utilizaría un algoritmo especializado de hash con sal, como bcrypt o Argon2id, para evitar almacenarlas en texto claro. Para el RFC y la información financiera, implementaría cifrado de datos, permisos por roles y auditorías. Las claves criptográficas se almacenarían en un gestor seguro de claves, con acceso restringido y rotación periódica. Las comunicaciones entre los clientes y PostgreSQL se protegerían mediante TLS con validación del certificado del servidor usando sslmode=verify-full. Finalmente, los respaldos se protegerían mediante cifrado, permisos restringidos y almacenamiento seguro

### ¿Cuál de los problemas consideras más crítico y por qué?

Considero especialmente crítico el almacenamiento de contraseñas en texto claro, porque una sola filtración puede revelar inmediatamente las credenciales de muchos usuarios. El riesgo aumenta si reutilizan esas contraseñas en otros servicios.

La exposición de claves criptográficas también puede ser muy grave, ya que podría permitir descifrar grandes cantidades de información. La prioridad real debe establecerse según el alcance de la exposición, los datos afectados y las posibilidades de explotación.

### ¿Tener correctamente configurados los usuarios y permisos elimina estos riesgos?

No. Los usuarios, roles y permisos son fundamentales, pero no eliminan todos los riesgos criptográficos.

Un usuario con permisos legítimos de lectura podría consultar contraseñas en texto claro si están almacenadas de esa forma. Asimismo, los archivos de respaldo, los scripts con secretos y las comunicaciones sin protección pueden exponer información fuera de los controles ordinarios de las tablas.

Por ello, se necesitan controles complementarios: protección de contraseñas, cifrado, TLS, gestión de claves, seguridad de los respaldos y revisión de los repositorios.

### Conclusión
La seguridad de una base de datos requiere una defensa en profundidad. El control de acceso debe complementarse con mecanismos criptográficos, protección de comunicaciones y una gestión segura de secretos para reducir el riesgo de exposición de información.

### Actividad 9 — Verificación de secretos antes de GitLab
La revisión de los archivos permite identificar posibles contraseñas, tokens, claves y cadenas de conexión. Antes de publicar el proyecto, deben eliminarse los secretos reales y comprobar que tampoco estén presentes en el historial de Git.