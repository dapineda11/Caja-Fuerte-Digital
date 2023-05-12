library verilog;
use verilog.vl_types.all;
entity conversor is
    port(
        unidades        : in     vl_logic_vector(3 downto 0);
        decenas         : in     vl_logic_vector(3 downto 0);
        centenas        : in     vl_logic_vector(3 downto 0);
        ultracarry      : in     vl_logic;
        u_ascii         : out    vl_logic_vector(7 downto 0);
        d_ascii         : out    vl_logic_vector(7 downto 0);
        c_ascii         : out    vl_logic_vector(7 downto 0);
        m_ascii         : out    vl_logic_vector(7 downto 0)
    );
end conversor;
