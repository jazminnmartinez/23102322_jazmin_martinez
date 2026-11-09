## Actividad 13 — Altas y bajas

### 1. El cliente Pedro Ruiz ya no existe en clientes. ¿Dónde queda evidencia de que existió y de sus datos?
Queda evidencia en la tabla auditoria.cambios_clientes, ahí se guardaron los eventos del INSERT y del DELETE, junto con los datos del cliente en formato JSON y aunque Pedro Ruiz ya no aparezca en clientes, todavía se puede comprobar que existió y consultar su RFC y otros datos registrados.

### 2. ¿Por qué ip_cliente está vacía en los eventos 2 y 3?
Porque las operaciones se realizaron localmente desde psql, mediante una conexión por socket, y no a través de una conexión de red. En ese tipo de conexión PostgreSQL no registra una dirección IP, por eso el campo aparece vacío.

### 3. La política de retención de la Unidad II pedía eliminar datos cuando ya no fueran necesarios. ¿Qué conflicto aparece? ¿Quién debe resolverlo?
Aparece un conflicto entre conservar evidencias para auditorías y eliminar los datos personales cuando ya no sean necesarios, la tabla de auditoría puede guardar información de clientes incluso después de que estos sean eliminados de la tabla principal.

Debe resolverlo la organización, especialmente los responsables de seguridad, bases de datos y protección de datos, deben establecer cuánto tiempo se conserva la información y cuándo debe eliminarse o protegerse para cumplir con las políticas de privacidad.