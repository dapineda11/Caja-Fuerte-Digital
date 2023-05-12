library verilog;
use verilog.vl_types.all;
entity CONTROL is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        Confirmar       : in     vl_logic;
        Conteo          : in     vl_logic;
        Columnas        : in     vl_logic_vector(3 downto 0);
        select_1        : out    vl_logic_vector(2 downto 0);
        select_2        : out    vl_logic_vector(2 downto 0);
        select_3        : out    vl_logic_vector(2 downto 0);
        EnableDATO      : out    vl_logic_vector(5 downto 0);
        reset_Cont      : out    vl_logic;
        big_conteo      : in     vl_logic;
        conteo_bits     : in     vl_logic;
        enableGuardar   : out    vl_logic;
        enableGlobal    : out    vl_logic;
        enableDesplazar : out    vl_logic;
        resetBigContador: out    vl_logic;
        reset_cont_bits : out    vl_logic;
        estados         : out    vl_logic_vector(39 downto 0)
    );
end CONTROL;
