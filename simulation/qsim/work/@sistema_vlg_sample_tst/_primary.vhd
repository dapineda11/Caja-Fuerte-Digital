library verilog;
use verilog.vl_types.all;
entity Sistema_vlg_sample_tst is
    port(
        sistema_clki    : in     vl_logic;
        sistema_columnas: in     vl_logic_vector(3 downto 0);
        sistema_confirmar: in     vl_logic;
        sistema_reset   : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Sistema_vlg_sample_tst;
