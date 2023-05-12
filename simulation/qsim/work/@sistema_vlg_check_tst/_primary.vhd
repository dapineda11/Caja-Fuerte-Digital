library verilog;
use verilog.vl_types.all;
entity Sistema_vlg_check_tst is
    port(
        dato1           : in     vl_logic_vector(3 downto 0);
        dato2           : in     vl_logic_vector(3 downto 0);
        dato3           : in     vl_logic_vector(3 downto 0);
        dato4           : in     vl_logic_vector(3 downto 0);
        dato5           : in     vl_logic_vector(3 downto 0);
        dato6           : in     vl_logic_vector(3 downto 0);
        enable_melo     : in     vl_logic_vector(5 downto 0);
        leer_melo       : in     vl_logic_vector(3 downto 0);
        sistema_centena : in     vl_logic_vector(6 downto 0);
        sistema_clko    : in     vl_logic;
        sistema_decena  : in     vl_logic_vector(6 downto 0);
        sistema_estados : in     vl_logic_vector(34 downto 0);
        sistema_filas   : in     vl_logic_vector(3 downto 0);
        sistema_miles   : in     vl_logic_vector(6 downto 0);
        sistema_unidad  : in     vl_logic_vector(6 downto 0);
        suma1           : in     vl_logic_vector(3 downto 0);
        suma2           : in     vl_logic_vector(3 downto 0);
        suma3           : in     vl_logic_vector(3 downto 0);
        suma4           : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Sistema_vlg_check_tst;
