--ACTIVIDAD 7 — RETENCIÓN DE DATOS
SELECT *FROM clientes
WHERE fecha_alta <
      CURRENT_DATE - INTERVAL '5 years';



--Verificación final
--Área de soporte 
SET ROLE soporte;
--Debe poder consultar:
SELECT * FROM v_clientes_soporte;

--no acceder directamente a:
SELECT * FROM clientes;

--Área de analítica
SET ROLE analista;
--Debe poder consultar:
SELECT * FROM analitica.clientes;

--pero no:
SELECT * FROM pii.mapa_cliente;

--ni:
SELECT * FROM public.clientes;