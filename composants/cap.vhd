library 	ieee;
use		ieee.std_logic_1164.all;
use		ieee.std_logic_unsigned.all;

library	work;
use		work.tp_vhdl_pack.all;

entity cap is
port (clk, raz_n, pwm_compass, start_stop, continu				: in  	std_logic;
		data_compass														: out std_logic_vector(8 downto 0);
		data_valid															: out std_logic

		);
end cap;

architecture ar of cap is
 
 signal icpt_out, i_data_compass								: std_logic_vector(8 downto 0);
 signal idata_valid			: std_logic; 
 signal i_clk_10khz, i_clk_1hz	: std_logic;
 signal ireset_cpt			: std_logic; 

 				
begin

 data_compass	<= i_data_compass;
 data_valid	<= idata_valid;

u0_prediv5000 : prediv_5000
	port 	map (	clk		=> clk,
					reset_n	=> raz_n, 
					clk_div	=> i_clk_10khz
			  );
			  
u0_prediv10000 : prediv_10000
	port 	map (	clk		=> i_clk_10khz,
					reset_n	=> raz_n, 
					clk_div	=> i_clk_1hz
			  );

u0_cpt : cpt
	port 	map (	clk		=> i_clk_10khz,
					reset_n	=> ireset_cpt, 
					cpt_out	=> icpt_out,
					pwm_compass => pwm_compass
			  );
			  
u0_statemachine : statemachine
	port 	map (	clk		=> clk,
					raz_n	=> raz_n, 
					cpt_out	=> icpt_out,
					data_compass => i_data_compass,
					pwm_compass => pwm_compass,
					timer1s => i_clk_1hz,
					start_stop => start_stop,
					data_valid => idata_valid,
					reset_cpt => ireset_cpt,
					continu => continu
			  );



end ar;
