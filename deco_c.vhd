--Definicion de las bibliotecas 
library IEEE; 
use IEEE.std_logic_1164.all; 
library ALTERA;
use ALTERA.altera_primitives_components.all;


--******************************************************--
-- este bloque corresponde al deco para centenas
-- este deco muestra en el 7 segmentos la centena ingresada
-- y la centena del numero sumado final.		                        --
--       					        --
--                                                      --
--******************************************************--


entity deco_c is
port(
	
		ent_c		: in std_logic_vector (3 downto 0);
		centena	: out std_logic_vector (6 downto 0) --gfedcba
		);
	end entity deco_c;
	


architecture deco_cArch of deco_c is
begin

centena(0) <= (not( ( ( (not ent_c(0) ) or (ent_c(1) ) or(ent_c(2) ) or (ent_c(3) ) ) and ( (ent_c(0) ) or(ent_c(1) ) or (not ent_c(2) ) or (ent_c(3) ) ) and( (not ent_c(0) ) or (not ent_c(1) ) or (ent_c(2) )or (not ent_c(3) ) ) and ( (not ent_c(0) ) or(ent_c(1) ) or (not ent_c(2) ) or (not ent_c(3) ) ) ) )) ;
centena(1) <= (not( ( ( (not ent_c(0) ) or (ent_c(1) ) or(not ent_c(2) )or (ent_c(3) ) ) and ( (ent_c(0) ) or(not ent_c(1) ) or (not ent_c(2) )or (ent_c(3) ) ) and( (not ent_c(0) ) or (not ent_c(1) ) or (ent_c(2) ) or(not ent_c(3) ) ) and ( (ent_c(0) ) or (ent_c(1) ) or(not ent_c(2) )or (not ent_c(3) ) ) and ( (not ent_c(0) )or (not ent_c(1) ) or (not ent_c(2) ) or(not ent_c(3) ) ) ) )) ;
centena(2) <= (not( ( ( (ent_c(0) ) or (not ent_c(1) ) or(ent_c(2) ) or (ent_c(3) ) ) and ( (ent_c(0) ) or (not ent_c(1) ) or (not ent_c(2) ) or (not ent_c(3) ) ) and( (ent_c(0) ) or (ent_c(1) ) or (not ent_c(2) ) or (not ent_c(3) ) ) and ( (not ent_c(0) ) or (not ent_c(1) )or (not ent_c(2) ) or (not ent_c(3) ) ) ) )) ;
centena(3) <= (not( ( ( (not ent_c(0) ) or (ent_c(1) ) or(ent_c(2) )or (ent_c(3) ) ) and ( (ent_c(0) ) or(ent_c(1) ) or (not ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) ) or (not ent_c(1) ) or (not ent_c(2) ) or (ent_c(3) ) ) and ( (not ent_c(0) ) or (ent_c(1) ) or (ent_c(2) )or (not ent_c(3) ) ) and ( (ent_c(0) ) or (not ent_c(1) ) or (ent_c(2) )or (not ent_c(3) ) ) and ( (not ent_c(0) ) or (not ent_c(1) ) or (not ent_c(2) )or (not ent_c(3) ) ) ) )) ;
centena(4) <= (not( ( ( (not ent_c(0) ) or (ent_c(1) ) or(ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) ) or(not ent_c(1) ) or (ent_c(2) )or (ent_c(3) ) ) and( (ent_c(0) ) or (ent_c(1) ) or (not ent_c(2) ) or(ent_c(3) ) ) and ( (not ent_c(0) ) or (ent_c(1) ) or(not ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) )or (not ent_c(1) ) or (not ent_c(2) )or (ent_c(3) ) )and ( (not ent_c(0) ) or (ent_c(1) ) or (ent_c(2) ) or(not ent_c(3) ) ) ) )) ;
centena(5) <= (not( ( ( (not ent_c(0) ) or (ent_c(1) ) or (ent_c(2) )or (ent_c(3) ) ) and ( (ent_c(0) ) or (not ent_c(1) ) or (ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) ) or (not ent_c(1) ) or (ent_c(2) ) or(ent_c(3) ) ) and ( (not ent_c(0) ) or (not ent_c(1) )or (not ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) )or (ent_c(1) ) or (not ent_c(2) )or (not ent_c(3) ) ) ) ) );
centena(6) <= (not( ( ( (ent_c(0) ) or (ent_c(1) ) or (ent_c(2) )or (ent_c(3) ) ) and ( (not ent_c(0) ) or(ent_c(1) ) or (ent_c(2) )or (ent_c(3) ) ) ) ) );

End deco_cArch ;