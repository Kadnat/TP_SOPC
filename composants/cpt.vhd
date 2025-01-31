library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

entity cpt is
port (
		pwm_compass, clk, reset_n : in std_logic;
		cpt_out : out std_logic_vector(8 downto 0)
		);
end entity;

architecture arch_cpt of cpt is
    signal cpt_reg : std_logic_vector(8 downto 0) := "000000000";
	 
begin
    p_cpt_reg : process(clk)
    begin
        if rising_edge(clk) then
			  if reset_n = '0' then
					cpt_reg <= "000000000";
			  elsif clk = '1' and pwm_compass = '1' then
					cpt_reg <= cpt_reg + 1;
					
			  elsif cpt_reg >= "101100111" then
					cpt_reg <= "000000000";
           else
                cpt_reg <= cpt_reg;
           end if;
        end if;
    end process p_cpt_reg;

cpt_out <= cpt_reg;
	 
end arch_cpt;

