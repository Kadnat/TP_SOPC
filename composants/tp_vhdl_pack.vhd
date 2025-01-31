library	ieee;
use		ieee.std_logic_1164.all;

package tp_vhdl_pack is

component prediv_5000 is
port (
		clk, reset_n : in std_logic;
		clk_div : out std_logic
		);
end component;

component cpt is
port (
		pwm_compass, clk, reset_n : in std_logic;
		cpt_out : out std_logic_vector(8 downto 0)
		);
end component;

component prediv_10000 is
port (
		clk, reset_n : in std_logic;
		clk_div : out std_logic
		);
end component;

component statemachine is
      port(
           continu, start_stop, raz_n, clk: in std_logic;
           data_valid : out std_logic;
			  reset_cpt : out std_logic;
           pwm_compass, timer1s : in std_logic;
			  cpt_out : in std_logic_vector(8 downto 0);
           data_compass : out std_logic_vector(8 downto 0)         
           );
end component;

component cap is
port (clk, raz_n, pwm_compass, start_stop, continu				: in  	std_logic;
		data_compass														: out std_logic_vector(8 downto 0);
		data_valid															: out std_logic

		);
end component;

end tp_vhdl_pack;
