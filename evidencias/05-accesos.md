## Actividad 5 — Accesos exitosos y fallidos

### 1. La bitácora registra el usuario app_ventas en el intento fallido. ¿Eso prueba que la aplicación de ventas intentó entrar? ¿Qué prueba realmente?
No, lo que demuestra es que alguien o algún programa intentó conectarse usando el usuario app_ventas desde la dirección IP 127.0.0.1. 

### 2. ¿Qué información adicional registra PostgreSQL cuando el rol no existe? ¿Por qué aparece en la bitácora y no en el mensaje que recibe el cliente?
PostgreSQL registra un detalle que indica que el rol usuario_inexistente no existe, esa información aparece en la bitácora para ayudar al administrador a entender mejor lo que pasó.

### 3. ¿Por qué app=[unknown] en el intento fallido, pero app=app-ventas-web en la desconexión?
Porque en el intento fallido PostgreSQL todavía no había terminado de identificar y autorizar la conexión, así que aún no tenía disponible el nombre de la aplicación. 

### 4. ¿Qué patrón de varias líneas te haría sospechar de un ataque de fuerza bruta? Escribe la consulta que contaría los intentos fallidos por usuario.
Serían sospechosos muchos intentos fallidos en poco tiempo, especialmente si se repiten desde la misma dirección IP y prueban diferentes contraseñas o usuarios.