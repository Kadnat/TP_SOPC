	component unsaved is
		port (
			avalon_pwm_writeresponsevalid_n : out std_logic;                                       -- writeresponsevalid_n
			bouttons_export                 : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			clk_clk                         : in  std_logic                    := 'X';             -- clk
			leds_export                     : out std_logic_vector(7 downto 0);                    -- export
			switch_export                   : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			in_pwm_beginbursttransfer       : in  std_logic                    := 'X'              -- beginbursttransfer
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			avalon_pwm_writeresponsevalid_n => CONNECTED_TO_avalon_pwm_writeresponsevalid_n, -- avalon_pwm.writeresponsevalid_n
			bouttons_export                 => CONNECTED_TO_bouttons_export,                 --   bouttons.export
			clk_clk                         => CONNECTED_TO_clk_clk,                         --        clk.clk
			leds_export                     => CONNECTED_TO_leds_export,                     --       leds.export
			switch_export                   => CONNECTED_TO_switch_export,                   --     switch.export
			in_pwm_beginbursttransfer       => CONNECTED_TO_in_pwm_beginbursttransfer        --     in_pwm.beginbursttransfer
		);

