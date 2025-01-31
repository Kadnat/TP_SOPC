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
-- Generated on "01/22/2025 09:21:48"
                                                            
-- Vhdl Test Bench template for design  :  prediv_10000
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY prediv_10000_vhd_tst IS
END prediv_10000_vhd_tst;
ARCHITECTURE prediv_10000_arch OF prediv_10000_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clk_div : STD_LOGIC;
SIGNAL reset_n : STD_LOGIC;


COMPONENT prediv_10000
	PORT (
	clk : IN STD_LOGIC;
	clk_div : OUT STD_LOGIC;
	reset_n : IN STD_LOGIC
	);
END COMPONENT;


BEGIN
	i1 : prediv_10000
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clk_div => clk_div,
	reset_n => reset_n
	);

processA : PROCESS                                                                                 
BEGIN   
	reset_n <= '0';
	WAIT FOR 20us;    
	reset_n <= '1';
	WAIT FOR 3000ms; 
                                                    
END PROCESS processA; 

processB : PROCESS                                                                                 
BEGIN    
	
	clk <= '0';
	WAIT FOR 99990ns;
	clk <= '1';
	WAIT FOR 10ns;
	
END PROCESS processB; 


	
END prediv_10000_arch;
