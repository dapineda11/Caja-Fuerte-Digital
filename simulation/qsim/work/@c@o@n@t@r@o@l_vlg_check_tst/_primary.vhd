library verilog;
use verilog.vl_types.all;
entity CONTROL_vlg_check_tst is
    port(
        EnableDATO      : in     vl_logic_vector(5 downto 0);
        enableDesplazar : in     vl_logic;
        enableGlobal    : in     vl_logic;
        enableGuardar   : in     vl_logic;
        estados         : in     vl_logic_vector(39 downto 0);
        reset_Cont      : in     vl_logic;
        reset_cont_bits : in     vl_logic;
        resetBigContador: in     vl_logic;
        select_1        : in     vl_logic_vector(2 downto 0);
        select_2        : in     vl_logic_vector(2 downto 0);
        select_3        : in     vl_logic_vector(2 downto 0);
        sampler_rx      : in     vl_logic
    );
end CONTROL_vlg_check_tst;
