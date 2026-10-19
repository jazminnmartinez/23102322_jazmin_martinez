###  Actividad 2 — Cifrado de información sensible

¿Qué diferencia existe entre crypt() y pgp_sym_encrypt()?
crypt() se utiliza en este laboratorio para generar y verificar hashes de contraseñas. No permite recuperar la contraseña original y pgp_sym_encrypt() cifra información mediante una clave simétrica, de manera que el dato original puede recuperarse utilizando pgp_sym_decrypt() y la clave correcta.

¿Cuál de los dos mecanismos permite recuperar el dato original?
pgp_sym_encrypt() permite recuperar el dato original mediante pgp_sym_decrypt(), siempre que se disponga de la clave correcta y los datos cifrados sean válidos.

¿Qué ocurre si se utiliza una clave incorrecta?
El descifrado normalmente produce un error, porque la clave no permite recuperar correctamente el contenido cifrado. No debe esperarse que el sistema devuelva el RFC original.

¿Qué problema de seguridad representa colocar la clave directamente en una consulta?
La clave puede quedar expuesta en scripts SQL, repositorios Git, registros de ejecución, capturas de pantalla o archivos compartidos. Si una persona no autorizada obtiene la clave y los datos cifrados, podría descifrar la información protegida.