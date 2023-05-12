--*************************--
-- DEFINICIÓN DE LIBRERIAS --
--*************************--
library IEEE; 
use IEEE.std_logic_1164.all;
--****--
-- DEFINICIÓN DE ENTIDAD --
--****--
	entity BARRIDO is
port(
			cuenta:IN std_logic_vector(1 downto 0); --	selector	
			filas: OUT std_logic_vector(3 downto 0) --
			
	  );
end entity BARRIDO;    

--******************************************************--
-- este bloque corresponde al barrido en filas que se 
-- realiza constantemente para poder leer un digito		                        --
--       					        --
--                                                      --
--******************************************************--
    
--***--
--DEFINICIÓN DE ARQUITECTURA --
--***--
architecture BARRIDOArch of BARRIDO is
--***--
--DEFINICIÓN DE COMPONENTES--
--***-- 

--DEFINICIÓN DE SEÑALES DE CONEXIÓN --
--****--
signal c0: std_logic;
signal c1: std_logic;

--******--
--Instancias y Conectividad
--******--
begin
c0 <= cuenta(0);
c1 <= cuenta(1);

filas(0) <= (not c0) and (not c1);
filas(1) <= (c0) 		and (not c1);
filas(2) <= (not c0) and (c1);
filas(3) <= (c0) 		and (c1);

end  BARRIDOArch;