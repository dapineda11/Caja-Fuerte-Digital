library verilog;
use verilog.vl_types.all;
entity conversor_vlg_sample_tst is
    port(
        centenas        : in     vl_logic_vector(3 downto 0);
        decenas         : in     vl_logic_vector(3 downto 0);
        ultracarry      : in     vl_logic;
        unidades        : in     vl_logic_vector(3 downto 0);
        sampler_tx      : out    vl_logic
    );
end conversor_vlg_sample_tst;
