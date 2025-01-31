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
-- Generated on "01/21/2025 17:24:17"
                                                            
-- Vhdl Test Bench template for design  :  statemachine
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY tb_statemachine IS
END tb_statemachine;
ARCHITECTURE statemachine_arch OF tb_statemachine IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC := '0';
SIGNAL continu : STD_LOGIC := '0';
SIGNAL cpt_out : STD_LOGIC_VECTOR(8 DOWNTO 0) := "010110100" ;
SIGNAL data_compass : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL data_valid : STD_LOGIC;
SIGNAL pwm_compass : STD_LOGIC;
SIGNAL raz_n : STD_LOGIC;
SIGNAL start_stop : STD_LOGIC;
COMPONENT statemachine
	PORT (
	clk : IN STD_LOGIC;
	continu : IN STD_LOGIC;
	cpt_out : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	data_compass : BUFFER STD_LOGIC_VECTOR(8 DOWNTO 0);
	data_valid : BUFFER STD_LOGIC;
	pwm_compass : IN STD_LOGIC;
	raz_n : IN STD_LOGIC;
	start_stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : statemachine
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	continu => continu,
	cpt_out => cpt_out,
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
	WAIT FOR 800ms; 
                                                    
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

processF : PROCESS                                                                                 
BEGIN    
	
	WAIT FOR 150ms;
	cpt_out<= "000111110";
                                                    
END PROCESS processF; 
                                                            
	
END statemachine_arch;
