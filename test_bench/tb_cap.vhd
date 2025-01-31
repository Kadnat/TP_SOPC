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
-- Generated on "01/22/2025 11:43:30"
                                                            
-- Vhdl Test Bench template for design  :  cap
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY cap_vhd_tst IS
END cap_vhd_tst;
ARCHITECTURE cap_arch OF cap_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL continu : STD_LOGIC;
SIGNAL data_compass : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL data_valid : STD_LOGIC;
SIGNAL pwm_compass : STD_LOGIC;
SIGNAL raz_n : STD_LOGIC;
SIGNAL start_stop : STD_LOGIC;
COMPONENT cap
	PORT (
	clk : IN STD_LOGIC;
	continu : IN STD_LOGIC;
	data_compass : OUT STD_LOGIC_VECTOR(8 DOWNTO 0);
	data_valid : OUT STD_LOGIC;
	pwm_compass : IN STD_LOGIC;
	raz_n : IN STD_LOGIC;
	start_stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : cap
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	continu => continu,
	data_compass => data_compass,
	data_valid => data_valid,
	pwm_compass => pwm_compass,
	raz_n => raz_n,
	start_stop => start_stop
	);


processA : PROCESS                                                                                 
BEGIN   
	raz_n <= '0';
	WAIT FOR 20us;    
	raz_n <= '1';
	WAIT FOR 8000ms; 
                                                    
END PROCESS processA; 

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


processE : PROCESS                                                                                 
BEGIN    
	

	start_stop <= '0';
	WAIT FOR 1ms;
	start_stop <= '1';
	WAIT FOR 1ms;
	start_stop <= '0';
	WAIT FOR 300ms;

                                                    
END PROCESS processE; 



processH : PROCESS                                                                                 
BEGIN    
	
	continu <= '0';
	WAIT FOR 800ms;
	continu <= '1';
	WAIT FOR 8000ms;
                                                    
END PROCESS processH; 
	
END cap_arch;
