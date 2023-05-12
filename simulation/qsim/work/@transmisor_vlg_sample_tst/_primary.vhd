library verilog;
use verilog.vl_types.all;
entity Transmisor_vlg_sample_tst is
    port(
        Big_out         : in     vl_logic_vector(35 downto 0);
        clkTransmisor   : in     vl_logic;
        EnableDesplazar : in     vl_logic;
        EnableGlobal    : in     vl_logic;
        EnableGuardar   : in     vl_logic;
        resetTransmisor : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Transmisor_vlg_sample_tst;
