-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "01/30/2025 22:35:31"
                                                            
-- Vhdl Test Bench template for design  :  avalon_cap
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY avalon_cap_vhd_tst IS
END avalon_cap_vhd_tst;
ARCHITECTURE avalon_cap_arch OF avalon_cap_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL address : STD_LOGIC;
SIGNAL chipselect : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL pwm_compass : STD_LOGIC;
SIGNAL readdata : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL reset_n : STD_LOGIC;
SIGNAL write_n : STD_LOGIC;
SIGNAL writedata : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT avalon_cap
	PORT (
	address : IN STD_LOGIC;
	chipselect : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	pwm_compass : IN STD_LOGIC;
	readdata : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	reset_n : IN STD_LOGIC;
	write_n : IN STD_LOGIC;
	writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : avalon_cap
	PORT MAP (
-- list connections between master ports and signals
	address => address,
	chipselect => chipselect,
	clk => clk,
	pwm_compass => pwm_compass,
	readdata => readdata,
	reset_n => reset_n,
	write_n => write_n,
	writedata => writedata
	);

processA : PROCESS                                                                                 
BEGIN   
	reset_n <= '0';
	WAIT FOR 20us;    
	reset_n <= '1';
	WAIT FOR 800ms; 
                                                    
END PROCESS processA; 

processF : PROCESS                                                                                 
BEGIN   
	chipselect <= '1';
	write_n <= '0';
	writedata <= "00000000000000000000000000000011";
	address <= '0';
	WAIT FOR 100us;    
	chipselect <= '0';
	chipselect <= '1';
	address <= '1';
	WAIT FOR 800ms; 
                                                    
END PROCESS processF; 

processB : PROCESS                                                                                 
BEGIN    
	
	clk <= '0';
	WAIT FOR 10ns;
	clk <= '1';
	WAIT FOR 10ns;
                                                    
END PROCESS processB; 

processC : PROCESS                                                                                 
BEGIN    
	pwm_compass <= '1';
	WAIT FOR 19ms;
	pwm_compass <= '0';
	WAIT FOR 65ms;
	
	pwm_compass <= '1';
	WAIT FOR 17ms;
	pwm_compass <= '0';
	WAIT FOR 67ms;
	
	pwm_compass <= '1';
	WAIT FOR 15ms;
	pwm_compass <= '0';
	WAIT FOR 69ms;
	
	pwm_compass <= '1';
	WAIT FOR 13ms;
	pwm_compass <= '0';
	WAIT FOR 71ms;
	
	pwm_compass <= '1';
	WAIT FOR 10ms;
	pwm_compass <= '0';
	WAIT FOR 74ms;
	
	pwm_compass <= '1';
	WAIT FOR 25ms;
	pwm_compass <= '0';
	WAIT FOR 59ms;
	
	pwm_compass <= '1';
	WAIT FOR 30ms;
	pwm_compass <= '0';
	WAIT FOR 54ms;
                                                    
END PROCESS processC; 

	
END avalon_cap_arch;
