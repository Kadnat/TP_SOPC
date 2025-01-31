library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;


entity statemachine is
      port(
           continu, start_stop, raz_n, clk: in std_logic;
           data_valid : out std_logic;
			  reset_cpt : out std_logic;
           pwm_compass, timer1s : in std_logic;
			  cpt_out : in std_logic_vector(8 downto 0);
           data_compass : out std_logic_vector(8 downto 0)         
           );
end statemachine;


architecture arch of statemachine is
    TYPE State_type IS (state1, state2, state3,state4, state5, state6 , state7, state8, state9);
    SIGNAL state : State_Type;
	 
    signal s_data_valid : std_logic;
    signal s_data_compass : std_logic_vector(8 downto 0);
	 signal ireset_cpt : std_logic;
	 
    begin
        process(clk)
        begin				 
            if rising_edge(clk)then
					 if (raz_n='0') then
						s_data_valid <='0';
						s_data_compass <=(others=> '0');
						state <=state1;
						ireset_cpt <= '0';
					 end if;	
				
                case state is
                    when state1 =>
                        if (raz_n = '1' and start_stop = '1' and continu = '0') then
                            state <= state2;
									 s_data_valid <= '0';
								elsif (raz_n = '1' and continu = '1') then
									 state <= state7;
									 s_data_valid <= '0';
                        else
                            state <= state1;
                        end if;
                    when state2 =>
                        if (start_stop='0') then
                            state <= state3;
								else
                            state <= state2;
                        end if;
                    when state3 =>
                        if (pwm_compass='0') then
                            state <= state4;
									 ireset_cpt <= '0';
                        else
									state <= state3;
                        end if;
						  when state4 =>
                        if (pwm_compass='1') then
                            state <= state5;
									 ireset_cpt <= '1';
                        else
									state <= state4;
                        end if;
						  when state5 =>
                        if (pwm_compass='0') then
                            state <= state6;
									 s_data_valid <= '1';
									 s_data_compass <= cpt_out;
									 
									 ireset_cpt <= '0';
                        else
									state <= state5;
                        end if;	
						  when state6 =>
                        if (raz_n = '1' and start_stop = '1' and continu = '0') then
                            state <= state2;
                        elsif(raz_n = '0') then
									state <= state1;
								elsif(raz_n = '1' and continu = '1') then
									state <= state7;
								else
									state <= state6;
                        end if;
								
						  when state7 =>
                        if (timer1s='0') then
                            state <= state8;
                        else
									state <= state7;
                        end if;
								
						  when state8 =>
                        if (timer1s='1') then
                            state <= state9;
                        else
									state <= state8;
                        end if;
								
						  when state9 =>
                        if (timer1s='0') then
                            state <= state3;
                        else
									state <= state9;
                        end if;

                end case;
            end if;
        end process;
    data_compass <= s_data_compass;
    data_valid <= s_data_valid;
	 reset_cpt <= ireset_cpt;
end arch;