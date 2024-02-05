-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "01/07/2024 20:01:30"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Serialiser_Shift_register IS
    PORT (
	clk : IN std_logic;
	rst : IN std_logic;
	Shift_en : IN std_logic;
	load_en : IN std_logic;
	Din : IN std_logic_vector(7 DOWNTO 0);
	Dout : OUT std_logic
	);
END Serialiser_Shift_register;

-- Design Ports Information
-- Dout	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- load_en	=>  Location: PIN_L19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rst	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Shift_en	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[1]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[2]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[3]	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[4]	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[5]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[6]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Din[7]	=>  Location: PIN_K22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Serialiser_Shift_register IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_rst : std_logic;
SIGNAL ww_Shift_en : std_logic;
SIGNAL ww_load_en : std_logic;
SIGNAL ww_Din : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Dout : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \load_en~input_o\ : std_logic;
SIGNAL \Din[0]~input_o\ : std_logic;
SIGNAL \Din[1]~input_o\ : std_logic;
SIGNAL \Din[2]~input_o\ : std_logic;
SIGNAL \Din[3]~input_o\ : std_logic;
SIGNAL \Din[4]~input_o\ : std_logic;
SIGNAL \Din[5]~input_o\ : std_logic;
SIGNAL \Din[6]~input_o\ : std_logic;
SIGNAL \Shift_en~input_o\ : std_logic;
SIGNAL \Din[7]~input_o\ : std_logic;
SIGNAL \temp~8_combout\ : std_logic;
SIGNAL \rst~input_o\ : std_logic;
SIGNAL \temp~7_combout\ : std_logic;
SIGNAL \temp[0]~1_combout\ : std_logic;
SIGNAL \temp~6_combout\ : std_logic;
SIGNAL \temp~5_combout\ : std_logic;
SIGNAL \temp~4_combout\ : std_logic;
SIGNAL \temp~3_combout\ : std_logic;
SIGNAL \temp~2_combout\ : std_logic;
SIGNAL \temp~0_combout\ : std_logic;
SIGNAL temp : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Din[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[5]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[4]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Shift_en~input_o\ : std_logic;
SIGNAL \ALT_INV_rst~input_o\ : std_logic;
SIGNAL \ALT_INV_Din[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_load_en~input_o\ : std_logic;
SIGNAL ALT_INV_temp : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_rst <= rst;
ww_Shift_en <= Shift_en;
ww_load_en <= load_en;
ww_Din <= Din;
Dout <= ww_Dout;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_Din[7]~input_o\ <= NOT \Din[7]~input_o\;
\ALT_INV_Din[6]~input_o\ <= NOT \Din[6]~input_o\;
\ALT_INV_Din[5]~input_o\ <= NOT \Din[5]~input_o\;
\ALT_INV_Din[4]~input_o\ <= NOT \Din[4]~input_o\;
\ALT_INV_Din[3]~input_o\ <= NOT \Din[3]~input_o\;
\ALT_INV_Din[2]~input_o\ <= NOT \Din[2]~input_o\;
\ALT_INV_Din[1]~input_o\ <= NOT \Din[1]~input_o\;
\ALT_INV_Shift_en~input_o\ <= NOT \Shift_en~input_o\;
\ALT_INV_rst~input_o\ <= NOT \rst~input_o\;
\ALT_INV_Din[0]~input_o\ <= NOT \Din[0]~input_o\;
\ALT_INV_load_en~input_o\ <= NOT \load_en~input_o\;
ALT_INV_temp(7) <= NOT temp(7);
ALT_INV_temp(6) <= NOT temp(6);
ALT_INV_temp(5) <= NOT temp(5);
ALT_INV_temp(4) <= NOT temp(4);
ALT_INV_temp(3) <= NOT temp(3);
ALT_INV_temp(2) <= NOT temp(2);
ALT_INV_temp(1) <= NOT temp(1);
ALT_INV_temp(0) <= NOT temp(0);

-- Location: IOOBUF_X89_Y35_N96
\Dout~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => ALT_INV_temp(0),
	devoe => ww_devoe,
	o => ww_Dout);

-- Location: IOIBUF_X89_Y35_N61
\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G10
\clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \clk~input_o\,
	outclk => \clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y38_N4
\load_en~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_load_en,
	o => \load_en~input_o\);

-- Location: IOIBUF_X89_Y37_N38
\Din[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(0),
	o => \Din[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\Din[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(1),
	o => \Din[1]~input_o\);

-- Location: IOIBUF_X89_Y38_N21
\Din[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(2),
	o => \Din[2]~input_o\);

-- Location: IOIBUF_X89_Y35_N78
\Din[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(3),
	o => \Din[3]~input_o\);

-- Location: IOIBUF_X89_Y37_N4
\Din[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(4),
	o => \Din[4]~input_o\);

-- Location: IOIBUF_X89_Y37_N21
\Din[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(5),
	o => \Din[5]~input_o\);

-- Location: IOIBUF_X89_Y35_N44
\Din[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(6),
	o => \Din[6]~input_o\);

-- Location: IOIBUF_X89_Y37_N55
\Shift_en~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Shift_en,
	o => \Shift_en~input_o\);

-- Location: IOIBUF_X89_Y38_N55
\Din[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Din(7),
	o => \Din[7]~input_o\);

-- Location: LABCELL_X88_Y37_N18
\temp~8\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~8_combout\ = ( temp(7) & ( \Din[7]~input_o\ & ( (!\load_en~input_o\ & !\Shift_en~input_o\) ) ) ) # ( temp(7) & ( !\Din[7]~input_o\ & ( (!\Shift_en~input_o\) # (\load_en~input_o\) ) ) ) # ( !temp(7) & ( !\Din[7]~input_o\ & ( \load_en~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111101011111010100000000000000001010000010100000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Shift_en~input_o\,
	datae => ALT_INV_temp(7),
	dataf => \ALT_INV_Din[7]~input_o\,
	combout => \temp~8_combout\);

-- Location: IOIBUF_X89_Y38_N38
\rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rst,
	o => \rst~input_o\);

-- Location: FF_X88_Y37_N19
\temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~8_combout\,
	clrn => \ALT_INV_rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(7));

-- Location: LABCELL_X88_Y37_N12
\temp~7\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~7_combout\ = ( temp(7) & ( (!\load_en~input_o\) # (!\Din[6]~input_o\) ) ) # ( !temp(7) & ( (\load_en~input_o\ & !\Din[6]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010100000000010101010000000011111111101010101111111110101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datad => \ALT_INV_Din[6]~input_o\,
	dataf => ALT_INV_temp(7),
	combout => \temp~7_combout\);

-- Location: LABCELL_X88_Y37_N33
\temp[0]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp[0]~1_combout\ = ( \Shift_en~input_o\ ) # ( !\Shift_en~input_o\ & ( \load_en~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101111111111111111101010101010101011111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datae => \ALT_INV_Shift_en~input_o\,
	combout => \temp[0]~1_combout\);

-- Location: FF_X88_Y37_N13
\temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~7_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(6));

-- Location: LABCELL_X88_Y37_N15
\temp~6\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~6_combout\ = ( temp(6) & ( (!\load_en~input_o\) # (!\Din[5]~input_o\) ) ) # ( !temp(6) & ( (\load_en~input_o\ & !\Din[5]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Din[5]~input_o\,
	dataf => ALT_INV_temp(6),
	combout => \temp~6_combout\);

-- Location: FF_X88_Y37_N17
\temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~6_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(5));

-- Location: LABCELL_X88_Y37_N54
\temp~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~5_combout\ = ( temp(5) & ( (!\load_en~input_o\) # (!\Din[4]~input_o\) ) ) # ( !temp(5) & ( (\load_en~input_o\ & !\Din[4]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Din[4]~input_o\,
	dataf => ALT_INV_temp(5),
	combout => \temp~5_combout\);

-- Location: FF_X88_Y37_N56
\temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~5_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(4));

-- Location: LABCELL_X88_Y37_N57
\temp~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~4_combout\ = ( temp(4) & ( (!\load_en~input_o\) # (!\Din[3]~input_o\) ) ) # ( !temp(4) & ( (\load_en~input_o\ & !\Din[3]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Din[3]~input_o\,
	dataf => ALT_INV_temp(4),
	combout => \temp~4_combout\);

-- Location: FF_X88_Y37_N58
\temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~4_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(3));

-- Location: LABCELL_X88_Y37_N24
\temp~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~3_combout\ = ( temp(3) & ( (!\load_en~input_o\) # (!\Din[2]~input_o\) ) ) # ( !temp(3) & ( (\load_en~input_o\ & !\Din[2]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Din[2]~input_o\,
	dataf => ALT_INV_temp(3),
	combout => \temp~3_combout\);

-- Location: FF_X88_Y37_N25
\temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~3_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(2));

-- Location: LABCELL_X88_Y37_N27
\temp~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~2_combout\ = ( temp(2) & ( (!\load_en~input_o\) # (!\Din[1]~input_o\) ) ) # ( !temp(2) & ( (\load_en~input_o\ & !\Din[1]~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101000001010000010100000101000011111010111110101111101011111010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_load_en~input_o\,
	datac => \ALT_INV_Din[1]~input_o\,
	dataf => ALT_INV_temp(2),
	combout => \temp~2_combout\);

-- Location: FF_X88_Y37_N28
\temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~2_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(1));

-- Location: LABCELL_X88_Y37_N48
\temp~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \temp~0_combout\ = ( \Din[0]~input_o\ & ( temp(1) & ( !\load_en~input_o\ ) ) ) # ( !\Din[0]~input_o\ & ( temp(1) ) ) # ( !\Din[0]~input_o\ & ( !temp(1) & ( \load_en~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000111100001111000000000000000011111111111111111111000011110000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => \ALT_INV_load_en~input_o\,
	datae => \ALT_INV_Din[0]~input_o\,
	dataf => ALT_INV_temp(1),
	combout => \temp~0_combout\);

-- Location: FF_X88_Y37_N49
\temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputCLKENA0_outclk\,
	d => \temp~0_combout\,
	clrn => \ALT_INV_rst~input_o\,
	ena => \temp[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => temp(0));

-- Location: LABCELL_X62_Y20_N0
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


