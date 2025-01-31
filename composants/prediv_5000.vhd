library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity prediv_5000 is
port (
		clk, reset_n : in std_logic;
		clk_div : out std_logic
		);
end entity;


architecture arch_prediv_5000 of prediv_5000 is
signal timer_reg     : integer range 0 to 4999;
signal cycle   : std_logic;

begin
	p_timer_reg : process(clk)
		begin
			 if rising_edge(clk) then
				  if reset_n = '0' then
						timer_reg <= 0;
				  elsif cycle = '1' then
						timer_reg <= 0;
				  else
						timer_reg <= timer_reg + 1;
				  end if;
			 end if;
		end process p_timer_reg;

	cycle <= '1' when timer_reg = 4999 else '0';
	clk_div <= cycle;

end arch_prediv_5000 ;