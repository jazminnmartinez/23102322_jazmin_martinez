### Actividad 4 y actividad 5. Protección de las comunicaciones mediante TLS

¿La conexión actual utiliza TLS?
La respuesta depende del resultado de pg_stat_ssl, si ssl devuelve true, la conexión actual utiliza TLS y si devuelve false, la conexión actual no utiliza TLS.

¿Qué versión de TLS se está utilizando?
No se si sea porque hice mis consultas de forma local en mi computadora me regresaba null

¿Qué algoritmo de cifrado aparece?
Igual como la anterior me regresaba null

¿Qué diferencia existe entre una conexión protegida con TLS y una conexión sin TLS?
Una conexión con TLS protege la confidencialidad e integridad de los datos transmitidos y puede autenticar al servidor si se valida su certificado. Una conexión sin TLS no ofrece esa protección criptográfica en tránsito, por lo que la información podría quedar expuesta a observación o modificación por alguien con capacidad para interceptar la comunicación.

#### Objetivo

Verificar el estado de TLS en PostgreSQL y comprender la importancia de proteger los datos durante su transmisión.

#### Procedimiento

Se ejecutaron las consultas SHOW ssl, SHOW ssl_min_protocol_version, SHOW port y SHOW listen_addresses. También se consultó pg_stat_ssl para revisar si la sesión actual utiliza TLS, así como la versión y el algoritmo de cifrado.

#### Resultados

Estado de TLS: off.

Puerto: 5432.

TLS en la sesión actual: 

Algoritmo de cifrado:

#### Análisis

TLS protege la información durante su transmisión entre el cliente y el servidor. Para verificar adecuadamente la identidad del servidor, no basta con cifrar la conexión: también se debe validar su certificado y comprobar que el nombre del servidor coincide con el certificado.

#### Conclusión

La verificación de TLS permite identificar si la conexión actual está protegida. Para un entorno productivo se debe configurar TLS correctamente y utilizar validación de certificados, preferentemente con sslmode=verify-full cuando la infraestructura lo permita.