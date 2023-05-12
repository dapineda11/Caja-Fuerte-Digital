library verilog;
use verilog.vl_types.all;
entity CONTROL_vlg_sample_tst is
    port(
        big_conteo      : in     vl_logic;
        clk             : in     vl_logic;
        Columnas        : in     vl_logic_vector(3 downto 0);
        Confirmar       : in     vl_logic;
        Conteo          : in     vl_logic;
        conteo_bits     : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end CONTROL_vlg_sample_tst;
