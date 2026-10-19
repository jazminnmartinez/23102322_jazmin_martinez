### Actividad 3 — El problema de la gestión de claves

¿Qué ocurriría si esta clave fuera una clave utilizada realmente por una organización y el archivo se publicara en un repositorio Git? 
Si la clave real se publica en GitLab, una persona que consiga acceder a ella podría utilizarla para descifrar los datos protegidos con esa clave, siempre que también obtenga los datos cifrados. El secreto podría permanecer en el historial de Git incluso después de eliminarlo del archivo. Esto comprometería la confidencialidad de la información y podría generar consecuencias legales y operativas para la organización. 

#### Objetivo

Identificar los riesgos de almacenar claves criptográficas directamente en archivos SQL y comprender la importancia de mantenerlas separadas del código fuente.

#### Procedimiento

Se analizó una consulta SQL que utiliza una clave de prueba directamente en la función pgp_sym_decrypt().

#### Resultado

La consulta puede funcionar técnicamente, pero contiene una clave escrita directamente en el código. Si el archivo se comparte o se publica en GitLab, la clave podría quedar expuesta.

#### Análisis

Los repositorios conservan un historial de cambios, por lo que eliminar una clave de un archivo no garantiza que desaparezca de los commits anteriores. Una persona que obtenga la clave y los datos cifrados podría acceder a la información protegida.

#### Conclusión

Las claves criptográficas no deben almacenarse junto con el código ni los scripts que las utilizan. En un entorno real deben gestionarse mediante un mecanismo seguro, con acceso restringido, rotación y procedimientos de respuesta ante exposiciones accidentales.