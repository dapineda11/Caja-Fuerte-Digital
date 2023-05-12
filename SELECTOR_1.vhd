--*************************--
-- DEFINICIÓN DE LIBRERIAS --
--*************************--
library IEEE; 
use IEEE.std_logic_1164.all;
--****--
-- DEFINICIÓN DE ENTIDAD --
--****--
	entity SELECTOR_1 is
port(
			suma_u: IN std_logic_vector(3 downto 0); --
			DATO_in_1: IN std_logic_vector(3 downto 0); -- 
			DATO_in_4: IN std_logic_vector(3 downto 0); --
			
			select_1:IN std_logic_vector(2 downto 0); --	selector	
			ent_u: OUT std_logic_vector(3 downto 0) --
			
	  );
end entity SELECTOR_1;        
--***--
--DEFINICIÓN DE ARQUITECTURA --
--***--
architecture SELECTOR_1Arch of SELECTOR_1 is
--***--
--DEFINICIÓN DE COMPONENTES--
--***-- 

--DEFINICIÓN DE SEÑALES DE CONEXIÓN --
--****--
signal s0: std_logic;
signal s1: std_logic;
signal s2: std_logic;

--******--
--Instancias y Conectividad
--******--
begin
s0 <= select_1(0);
s1 <= select_1(1);
s2 <= select_1(2);

ent_u(0) <= (DatO_in_1(0) and s0) or (DatO_in_4(0) and s1) or (suma_u(0) and s2);
ent_u(1) <= (DatO_in_1(1) and s0) or (DatO_in_4(1) and s1) or (suma_u(1) and s2);
ent_u(2) <= (DatO_in_1(2) and s0) or (DatO_in_4(2) and s1) or (suma_u(2) and s2);  
ent_u(3) <= (DatO_in_1(3) and s0) or (DatO_in_4(3) and s1) or (suma_u(3) and s2);  

end  SELECTOR_1Arch;