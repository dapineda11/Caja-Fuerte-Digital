library verilog;
use verilog.vl_types.all;
entity Sistema is
    port(
        sistema_clki    : in     vl_logic;
        sistema_columnas: in     vl_logic_vector(3 downto 0);
        sistema_confirmar: in     vl_logic;
        sistema_reset   : in     vl_logic;
        sistema_clko    : out    vl_logic;
        sistema_filas   : out    vl_logic_vector(3 downto 0);
        sistema_unidad  : out    vl_logic_vector(6 downto 0);
        sistema_decena  : out    vl_logic_vector(6 downto 0);
        sistema_centena : out    vl_logic_vector(6 downto 0);
        sistema_miles   : out    vl_logic_vector(6 downto 0);
        sistema_estados : out    vl_logic_vector(34 downto 0);
        suma1           : out    vl_logic_vector(3 downto 0);
        suma2           : out    vl_logic_vector(3 downto 0);
        suma3           : out    vl_logic_vector(3 downto 0);
        dato1           : out    vl_logic_vector(3 downto 0);
        dato2           : out    vl_logic_vector(3 downto 0);
        dato3           : out    vl_logic_vector(3 downto 0);
        dato4           : out    vl_logic_vector(3 downto 0);
        dato5           : out    vl_logic_vector(3 downto 0);
        dato6           : out    vl_logic_vector(3 downto 0);
        leer_melo       : out    vl_logic_vector(3 downto 0);
        enable_melo     : out    vl_logic_vector(5 downto 0);
        suma4           : out    vl_logic
    );
end Sistema;
