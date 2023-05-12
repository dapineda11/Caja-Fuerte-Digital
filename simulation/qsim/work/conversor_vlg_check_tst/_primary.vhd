library verilog;
use verilog.vl_types.all;
entity conversor_vlg_check_tst is
    port(
        c_ascii         : in     vl_logic_vector(7 downto 0);
        d_ascii         : in     vl_logic_vector(7 downto 0);
        m_ascii         : in     vl_logic_vector(7 downto 0);
        u_ascii         : in     vl_logic_vector(7 downto 0);
        sampler_rx      : in     vl_logic
    );
end conversor_vlg_check_tst;
