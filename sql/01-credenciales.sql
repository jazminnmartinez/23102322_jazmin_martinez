-- ACTIVIDAD 1.- PROTECCIÓN DE CREDENCIALES
CREATE TABLE usuarios_insegura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL
);

--Insertamos un usuario de prueba:
INSERT INTO usuarios_insegura (usuario, password)
VALUES ('juan', 'Password123');

--Consulta:
SELECT * FROM usuarios_insegura;

--Generar una representación no reversible
SELECT crypt(
    'Password123',
    gen_salt('bf')
);

SELECT crypt(
    'Password123',
    gen_salt('bf')
);

--Crear una tabla para credenciales protegidas
CREATE TABLE usuarios_segura (
    id BIGSERIAL PRIMARY KEY,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL
);

--Inserta un usuario:
INSERT INTO usuarios_segura (usuario, password_hash)
VALUES (
    'juan',
    crypt('Password123', gen_salt('bf'))
);

--Consulta:
SELECT * FROM usuarios_segura;

--Verificar una contraseña
SELECT
    usuario,
    password_hash = crypt('Password123', password_hash)
        AS contraseña_correcta
FROM usuarios_segura
WHERE usuario = 'juan';

--Prueba con una contraseña incorrecta:
SELECT
    usuario,
    password_hash = crypt('OtraPassword', password_hash)
        AS contraseña_correcta
FROM usuarios_segura
WHERE usuario = 'juan';