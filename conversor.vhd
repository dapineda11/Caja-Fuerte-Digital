--*************************--
-- DEFINICIÓN DE LIBRERIAS --
--*************************--
library IEEE; 
use IEEE.std_logic_1164.all;
--****--
-- DEFINICIÓN DE ENTIDAD --
--****--
	entity conversor is
port(
			unidades: in std_logic_vector(3 downto 0);
			decenas: in std_logic_vector(3 downto 0);
			centenas: in std_logic_vector(3 downto 0);
			ultracarry: in std_logic;
			Big_out: out std_logic_vector(35 downto 0)
			
	  );
end entity conversor;    

--******************************************************--
-- este bloque convierte binario a ascii		                        --
--       					        --
--                                                      --
--******************************************************--
    
--***--
--DEFINICIÓN DE ARQUITECTURA --
--***--
architecture conversorarch of conversor is
--***--
--DEFINICIÓN DE COMPONENTES--
--***-- 

--DEFINICIÓN DE SEÑALES DE CONEXIÓN --
--****--


--******--
--Instancias y Conectividad
--******--
begin
Big_out(0) <= '0';
Big_out(1) <= '0';

Big_out(2) <= unidades(0);
Big_out(3) <= unidades(1);
Big_out(4) <= unidades(2);
Big_out(5) <= unidades(3);
Big_out(6) <= '1';
Big_out(7) <= '1';
Big_out(8) <= '0';
Big_out(9) <= '0';

Big_out(10) <= decenas(0);
Big_out(11) <= decenas(1);
Big_out(12) <= decenas(2);
Big_out(13) <= decenas(3);
Big_out(14) <= '1';
Big_out(15) <= '1';
Big_out(16) <= '0';
Big_out(17) <= '0';

Big_out(18) <= centenas(0);
Big_out(19) <= centenas(1);
Big_out(20) <= centenas(2);
Big_out(21) <= centenas(3);
Big_out(22) <= '1';
Big_out(23) <= '1';
Big_out(24) <= '0';
Big_out(25) <= '0';

Big_out(26) <= ultracarry;
Big_out(27) <= '0';
Big_out(28) <= '0';
Big_out(29) <= '0';
Big_out(30) <= '1';
Big_out(31) <= '1';
Big_out(32) <= '0';
Big_out(33) <= '0';

Big_out(34) <= '1';
Big_out(35) <= '0';
end  conversorArch;