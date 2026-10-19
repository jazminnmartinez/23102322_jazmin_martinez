# Actividad 07 — Comparación de mecanismos de protección

## Objetivo
Diferenciar los mecanismos de protección apropiados según el tipo de información y el momento en que se necesita proteger.

## Tabla comparativa

| Situación | Mecanismo apropiado | ¿Qué protege? |
|---|---|---|
| Contraseña de usuario | Hash de contraseñas con sal y un algoritmo especializado, como Argon2id o bcrypt | Permite verificar la contraseña sin almacenarla en texto claro. |
| RFC almacenado en una tabla | Cifrado de datos sensibles cuando existe una justificación para protegerlo de esa manera | Impide interpretar directamente el dato sin la clave correspondiente. |
| Consulta enviada desde un cliente al servidor | TLS | Protege la confidencialidad e integridad de los datos transmitidos y permite autenticar el servidor cuando se valida su certificado. |
| Respaldo de una base de datos | Cifrado del respaldo y almacenamiento con acceso restringido | Protege la información almacenada en archivos de respaldo. |
| Clave criptográfica | Gestión segura de claves mediante un gestor de secretos o un sistema de gestión de claves | Evita la exposición, limita el acceso y permite administrar el ciclo de vida de las claves. |

## Análisis
No existe un único mecanismo que resuelva todos los problemas de seguridad. Las contraseñas deben protegerse mediante mecanismos de derivación; los datos recuperables pueden cifrarse; las comunicaciones requieren TLS; y las claves necesitan controles de gestión independientes.

## Conclusión
La elección del mecanismo debe depender de la naturaleza de la información, su uso y los riesgos que se busca reducir.