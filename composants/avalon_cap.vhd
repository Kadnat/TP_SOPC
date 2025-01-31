library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library	work;
use		work.tp_vhdl_pack.all;

entity avalon_cap is
port (
		clk, chipselect, write_n, reset_n : in std_logic;
		writedata : in std_logic_vector (31 downto 0);
		readdata : out std_logic_vector (31 downto 0);
		pwm_compass, address : in std_logic
		);
end entity;

ARCHITECTURE arch_avalon_cap of avalon_cap IS
signal config: std_logic_vector (2 downto 0);
signal data_valid : std_logic;
signal idata_compass : std_logic_vector (8 downto 0);
signal istart_stop : std_logic;
signal icontinu : std_logic;
signal iraz_n : std_logic;


begin

u0_cap : cap
	port 	map (	clk		=> clk,
					raz_n	=> iraz_n, 
					pwm_compass	=> pwm_compass,
					start_stop => istart_stop,
					continu => icontinu,
					data_compass => idata_compass,
					data_valid => data_valid
			  );

		
--interface avalon
--décodage configuration
iraz_n <= config(0);
icontinu <= config(1);
istart_stop <= config(2);

--écriture registres
	process_write: process (clk, reset_n)
	begin
		if reset_n = '0' then
		config <= (others => '0');
		elsif clk'event and clk = '1' then
		if chipselect ='1' and write_n = '0' then
		if address = '0' then
		config <= (writedata (2 downto 0));
		end if;

		end if;
		end if; 
		end process;
		
-- lecture registres
	process_read: process(address, config, data_valid, idata_compass) 
	begin
		case address is
			when '0' => readdata <= X"0000000"&"0"&config;
			when '1' => readdata <=X"00000"&"00"&data_valid&idata_compass;
			when others => readdata <= (others => '0');
		end case;
	end process;
	
end arch_avalon_cap ;