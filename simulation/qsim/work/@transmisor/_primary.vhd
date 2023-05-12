library verilog;
use verilog.vl_types.all;
entity Transmisor is
    port(
        Big_out         : in     vl_logic_vector(35 downto 0);
        EnableGuardar   : in     vl_logic;
        EnableDesplazar : in     vl_logic;
        resetTransmisor : in     vl_logic;
        clkTransmisor   : in     vl_logic;
        EnableGlobal    : in     vl_logic;
        Salida          : out    vl_logic
    );
end Transmisor;
