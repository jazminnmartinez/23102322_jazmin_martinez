--Actividad 6 — Cambios de privilegios y de estructura
REVOKE UPDATE ON clientes FROM soporte_ana;
GRANT UPDATE ON clientes TO app_ventas;
ALTER TABLE clientes ADD COLUMN segmento VARCHAR(20);

--Crea un rol desechable escribiendo la contraseña en la sentencia, y elimínalo:
CREATE ROLE rol_temporal LOGIN PASSWORD 'Temporal_Practica_2026';
DROP ROLE rol_temporal;

--Consulta las sentencias registradas:
SELECT linea FROM dba.bitacora WHERE linea LIKE '%statement:%' ORDER BY num;