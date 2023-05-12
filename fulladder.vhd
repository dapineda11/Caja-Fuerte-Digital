--****--
-- DEFINICIÓN DE LIBRERIAS--
--****--
library IEEE; 
use IEEE.std_logic_1164.all;

--****--
-- DEFINICIÓN DE ENTIDAD  --
--****--
	 entity fulladder is
port(
		a         : IN std_logic;
	   b         : IN std_logic;
		Ci        : IN std_logic;    -- Carry IN
		
		Co        : OUT std_logic;   -- Carry OUT
		S         : OUT std_logic    -- Salida
	  );
end entity fulladder;        
--****--
--DEFINICIÓN DE ARQUITECTURA --
--****--
architecture fulladderArch of fulladder is
--***--
begin 
S <= a xor (b xor Ci); 
Co <= (b and Ci) OR (a and Ci) OR (a and b);
end  fulladderArch;