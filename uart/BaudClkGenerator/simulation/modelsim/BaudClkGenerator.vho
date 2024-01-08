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

-- DATE "01/07/2024 13:33:16"

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

ENTITY 	BaudClkGenerator IS
    PORT (
	Clk : IN std_logic;
	Rst : IN std_logic;
	Start : IN std_logic;
	BaudClk : OUT std_logic;
	Ready : OUT std_logic
	);
END BaudClkGenerator;

-- Design Ports Information
-- BaudClk	=>  Location: PIN_P19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ready	=>  Location: PIN_P17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clk	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Rst	=>  Location: PIN_R21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Start	=>  Location: PIN_R17,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BaudClkGenerator IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Clk : std_logic;
SIGNAL ww_Rst : std_logic;
SIGNAL ww_Start : std_logic;
SIGNAL ww_BaudClk : std_logic;
SIGNAL ww_Ready : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \Clk~input_o\ : std_logic;
SIGNAL \Clk~inputCLKENA0_outclk\ : std_logic;
SIGNAL \Start~input_o\ : std_logic;
SIGNAL \ClocksLeft~4_combout\ : std_logic;
SIGNAL \Rst~input_o\ : std_logic;
SIGNAL \BaudClk~reg0DUPLICATE_q\ : std_logic;
SIGNAL \ClocksLeft[3]~1_combout\ : std_logic;
SIGNAL \Add0~33_sumout\ : std_logic;
SIGNAL \ClocksLeft~3_combout\ : std_logic;
SIGNAL \ClocksLeft~2_combout\ : std_logic;
SIGNAL \ClocksLeft~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \BitPeriodCounter[8]~0_combout\ : std_logic;
SIGNAL \Add0~34\ : std_logic;
SIGNAL \Add0~29_sumout\ : std_logic;
SIGNAL \Add0~30\ : std_logic;
SIGNAL \Add0~25_sumout\ : std_logic;
SIGNAL \Add0~26\ : std_logic;
SIGNAL \Add0~21_sumout\ : std_logic;
SIGNAL \Add0~22\ : std_logic;
SIGNAL \Add0~17_sumout\ : std_logic;
SIGNAL \Add0~18\ : std_logic;
SIGNAL \Add0~13_sumout\ : std_logic;
SIGNAL \Add0~14\ : std_logic;
SIGNAL \Add0~9_sumout\ : std_logic;
SIGNAL \Add0~10\ : std_logic;
SIGNAL \Add0~5_sumout\ : std_logic;
SIGNAL \Add0~6\ : std_logic;
SIGNAL \Add0~1_sumout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \BaudClk~0_combout\ : std_logic;
SIGNAL \BaudClk~reg0_q\ : std_logic;
SIGNAL \Ready~0_combout\ : std_logic;
SIGNAL \Ready~reg0_q\ : std_logic;
SIGNAL BitPeriodCounter : std_logic_vector(8 DOWNTO 0);
SIGNAL ClocksLeft : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_BaudClk~reg0DUPLICATE_q\ : std_logic;
SIGNAL \ALT_INV_Start~input_o\ : std_logic;
SIGNAL \ALT_INV_Rst~input_o\ : std_logic;
SIGNAL \ALT_INV_Equal0~1_combout\ : std_logic;
SIGNAL \ALT_INV_Equal0~0_combout\ : std_logic;
SIGNAL ALT_INV_ClocksLeft : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_Ready~reg0_q\ : std_logic;
SIGNAL ALT_INV_BitPeriodCounter : std_logic_vector(8 DOWNTO 0);

BEGIN

ww_Clk <= Clk;
ww_Rst <= Rst;
ww_Start <= Start;
BaudClk <= ww_BaudClk;
Ready <= ww_Ready;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_BaudClk~reg0DUPLICATE_q\ <= NOT \BaudClk~reg0DUPLICATE_q\;
\ALT_INV_Start~input_o\ <= NOT \Start~input_o\;
\ALT_INV_Rst~input_o\ <= NOT \Rst~input_o\;
\ALT_INV_Equal0~1_combout\ <= NOT \Equal0~1_combout\;
\ALT_INV_Equal0~0_combout\ <= NOT \Equal0~0_combout\;
ALT_INV_ClocksLeft(0) <= NOT ClocksLeft(0);
ALT_INV_ClocksLeft(1) <= NOT ClocksLeft(1);
ALT_INV_ClocksLeft(2) <= NOT ClocksLeft(2);
ALT_INV_ClocksLeft(3) <= NOT ClocksLeft(3);
\ALT_INV_Ready~reg0_q\ <= NOT \Ready~reg0_q\;
ALT_INV_BitPeriodCounter(0) <= NOT BitPeriodCounter(0);
ALT_INV_BitPeriodCounter(1) <= NOT BitPeriodCounter(1);
ALT_INV_BitPeriodCounter(2) <= NOT BitPeriodCounter(2);
ALT_INV_BitPeriodCounter(3) <= NOT BitPeriodCounter(3);
ALT_INV_BitPeriodCounter(4) <= NOT BitPeriodCounter(4);
ALT_INV_BitPeriodCounter(5) <= NOT BitPeriodCounter(5);
ALT_INV_BitPeriodCounter(6) <= NOT BitPeriodCounter(6);
ALT_INV_BitPeriodCounter(7) <= NOT BitPeriodCounter(7);
ALT_INV_BitPeriodCounter(8) <= NOT BitPeriodCounter(8);

-- Location: IOOBUF_X89_Y9_N39
\BaudClk~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \BaudClk~reg0_q\,
	devoe => ww_devoe,
	o => ww_BaudClk);

-- Location: IOOBUF_X89_Y9_N22
\Ready~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_Ready~reg0_q\,
	devoe => ww_devoe,
	o => ww_Ready);

-- Location: IOIBUF_X89_Y35_N61
\Clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clk,
	o => \Clk~input_o\);

-- Location: CLKCTRL_G10
\Clk~inputCLKENA0\ : cyclonev_clkena
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	disable_mode => "low",
	ena_register_mode => "always enabled",
	ena_register_power_up => "high",
	test_syn => "high")
-- pragma translate_on
PORT MAP (
	inclk => \Clk~input_o\,
	outclk => \Clk~inputCLKENA0_outclk\);

-- Location: IOIBUF_X89_Y8_N21
\Start~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Start,
	o => \Start~input_o\);

-- Location: LABCELL_X88_Y7_N39
\ClocksLeft~4\ : cyclonev_lcell_comb
-- Equation(s):
-- \ClocksLeft~4_combout\ = (!\Start~input_o\ & !ClocksLeft(0))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010101000000000101010100000000010101010000000001010101000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Start~input_o\,
	datad => ALT_INV_ClocksLeft(0),
	combout => \ClocksLeft~4_combout\);

-- Location: IOIBUF_X89_Y8_N38
\Rst~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Rst,
	o => \Rst~input_o\);

-- Location: FF_X87_Y7_N26
\BaudClk~reg0DUPLICATE\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \BaudClk~0_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BaudClk~reg0DUPLICATE_q\);

-- Location: MLABCELL_X87_Y7_N12
\ClocksLeft[3]~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \ClocksLeft[3]~1_combout\ = ( \BaudClk~reg0DUPLICATE_q\ ) # ( !\BaudClk~reg0DUPLICATE_q\ & ( \Start~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011001100110011001111111111111111111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Start~input_o\,
	dataf => \ALT_INV_BaudClk~reg0DUPLICATE_q\,
	combout => \ClocksLeft[3]~1_combout\);

-- Location: FF_X88_Y7_N41
\ClocksLeft[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \ClocksLeft~4_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	ena => \ClocksLeft[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClocksLeft(0));

-- Location: LABCELL_X88_Y7_N0
\Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~33_sumout\ = SUM(( BitPeriodCounter(0) ) + ( VCC ) + ( !VCC ))
-- \Add0~34\ = CARRY(( BitPeriodCounter(0) ) + ( VCC ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(0),
	cin => GND,
	sumout => \Add0~33_sumout\,
	cout => \Add0~34\);

-- Location: LABCELL_X88_Y7_N30
\ClocksLeft~3\ : cyclonev_lcell_comb
-- Equation(s):
-- \ClocksLeft~3_combout\ = ( ClocksLeft(1) & ( ClocksLeft(0) ) ) # ( !ClocksLeft(1) & ( ClocksLeft(0) & ( \Start~input_o\ ) ) ) # ( ClocksLeft(1) & ( !ClocksLeft(0) & ( \Start~input_o\ ) ) ) # ( !ClocksLeft(1) & ( !ClocksLeft(0) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1111111111111111001100110011001100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Start~input_o\,
	datae => ALT_INV_ClocksLeft(1),
	dataf => ALT_INV_ClocksLeft(0),
	combout => \ClocksLeft~3_combout\);

-- Location: FF_X88_Y7_N32
\ClocksLeft[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \ClocksLeft~3_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	ena => \ClocksLeft[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClocksLeft(1));

-- Location: LABCELL_X88_Y7_N57
\ClocksLeft~2\ : cyclonev_lcell_comb
-- Equation(s):
-- \ClocksLeft~2_combout\ = ( ClocksLeft(0) & ( (!\Start~input_o\ & ClocksLeft(2)) ) ) # ( !ClocksLeft(0) & ( (!\Start~input_o\ & (!ClocksLeft(1) $ (ClocksLeft(2)))) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1010000000001010101000000000101000000000101010100000000010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Start~input_o\,
	datac => ALT_INV_ClocksLeft(1),
	datad => ALT_INV_ClocksLeft(2),
	dataf => ALT_INV_ClocksLeft(0),
	combout => \ClocksLeft~2_combout\);

-- Location: FF_X88_Y7_N59
\ClocksLeft[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \ClocksLeft~2_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	ena => \ClocksLeft[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClocksLeft(2));

-- Location: LABCELL_X88_Y7_N36
\ClocksLeft~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \ClocksLeft~0_combout\ = ( ClocksLeft(2) & ( (ClocksLeft(3)) # (\Start~input_o\) ) ) # ( !ClocksLeft(2) & ( (!ClocksLeft(3) $ (((ClocksLeft(0)) # (ClocksLeft(1))))) # (\Start~input_o\) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1101010101111111110101010111111101010101111111110101010111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_Start~input_o\,
	datab => ALT_INV_ClocksLeft(1),
	datac => ALT_INV_ClocksLeft(0),
	datad => ALT_INV_ClocksLeft(3),
	dataf => ALT_INV_ClocksLeft(2),
	combout => \ClocksLeft~0_combout\);

-- Location: FF_X88_Y7_N38
\ClocksLeft[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \ClocksLeft~0_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	ena => \ClocksLeft[3]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => ClocksLeft(3));

-- Location: LABCELL_X88_Y7_N54
\Equal0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ( !BitPeriodCounter(2) & ( (!BitPeriodCounter(0) & BitPeriodCounter(1)) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000011110000000000001111000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datac => ALT_INV_BitPeriodCounter(0),
	datad => ALT_INV_BitPeriodCounter(1),
	dataf => ALT_INV_BitPeriodCounter(2),
	combout => \Equal0~1_combout\);

-- Location: LABCELL_X88_Y7_N42
\BitPeriodCounter[8]~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \BitPeriodCounter[8]~0_combout\ = ( \Equal0~1_combout\ & ( \Equal0~0_combout\ ) ) # ( !\Equal0~1_combout\ & ( \Equal0~0_combout\ & ( (!ClocksLeft(0) & (!ClocksLeft(2) & (!ClocksLeft(3) & !ClocksLeft(1)))) ) ) ) # ( \Equal0~1_combout\ & ( 
-- !\Equal0~0_combout\ & ( (!ClocksLeft(0) & (!ClocksLeft(2) & (!ClocksLeft(3) & !ClocksLeft(1)))) ) ) ) # ( !\Equal0~1_combout\ & ( !\Equal0~0_combout\ & ( (!ClocksLeft(0) & (!ClocksLeft(2) & (!ClocksLeft(3) & !ClocksLeft(1)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "1000000000000000100000000000000010000000000000001111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClocksLeft(0),
	datab => ALT_INV_ClocksLeft(2),
	datac => ALT_INV_ClocksLeft(3),
	datad => ALT_INV_ClocksLeft(1),
	datae => \ALT_INV_Equal0~1_combout\,
	dataf => \ALT_INV_Equal0~0_combout\,
	combout => \BitPeriodCounter[8]~0_combout\);

-- Location: FF_X88_Y7_N2
\BitPeriodCounter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~33_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(0));

-- Location: LABCELL_X88_Y7_N3
\Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~29_sumout\ = SUM(( BitPeriodCounter(1) ) + ( GND ) + ( \Add0~34\ ))
-- \Add0~30\ = CARRY(( BitPeriodCounter(1) ) + ( GND ) + ( \Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(1),
	cin => \Add0~34\,
	sumout => \Add0~29_sumout\,
	cout => \Add0~30\);

-- Location: FF_X88_Y7_N5
\BitPeriodCounter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~29_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(1));

-- Location: LABCELL_X88_Y7_N6
\Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~25_sumout\ = SUM(( BitPeriodCounter(2) ) + ( GND ) + ( \Add0~30\ ))
-- \Add0~26\ = CARRY(( BitPeriodCounter(2) ) + ( GND ) + ( \Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(2),
	cin => \Add0~30\,
	sumout => \Add0~25_sumout\,
	cout => \Add0~26\);

-- Location: FF_X88_Y7_N8
\BitPeriodCounter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~25_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(2));

-- Location: LABCELL_X88_Y7_N9
\Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~21_sumout\ = SUM(( BitPeriodCounter(3) ) + ( GND ) + ( \Add0~26\ ))
-- \Add0~22\ = CARRY(( BitPeriodCounter(3) ) + ( GND ) + ( \Add0~26\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(3),
	cin => \Add0~26\,
	sumout => \Add0~21_sumout\,
	cout => \Add0~22\);

-- Location: FF_X88_Y7_N11
\BitPeriodCounter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~21_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(3));

-- Location: LABCELL_X88_Y7_N12
\Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~17_sumout\ = SUM(( BitPeriodCounter(4) ) + ( GND ) + ( \Add0~22\ ))
-- \Add0~18\ = CARRY(( BitPeriodCounter(4) ) + ( GND ) + ( \Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(4),
	cin => \Add0~22\,
	sumout => \Add0~17_sumout\,
	cout => \Add0~18\);

-- Location: FF_X88_Y7_N14
\BitPeriodCounter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~17_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(4));

-- Location: LABCELL_X88_Y7_N15
\Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~13_sumout\ = SUM(( BitPeriodCounter(5) ) + ( GND ) + ( \Add0~18\ ))
-- \Add0~14\ = CARRY(( BitPeriodCounter(5) ) + ( GND ) + ( \Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(5),
	cin => \Add0~18\,
	sumout => \Add0~13_sumout\,
	cout => \Add0~14\);

-- Location: FF_X88_Y7_N17
\BitPeriodCounter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~13_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(5));

-- Location: LABCELL_X88_Y7_N18
\Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~9_sumout\ = SUM(( BitPeriodCounter(6) ) + ( GND ) + ( \Add0~14\ ))
-- \Add0~10\ = CARRY(( BitPeriodCounter(6) ) + ( GND ) + ( \Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(6),
	cin => \Add0~14\,
	sumout => \Add0~9_sumout\,
	cout => \Add0~10\);

-- Location: FF_X88_Y7_N20
\BitPeriodCounter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~9_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(6));

-- Location: LABCELL_X88_Y7_N21
\Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~5_sumout\ = SUM(( BitPeriodCounter(7) ) + ( GND ) + ( \Add0~10\ ))
-- \Add0~6\ = CARRY(( BitPeriodCounter(7) ) + ( GND ) + ( \Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(7),
	cin => \Add0~10\,
	sumout => \Add0~5_sumout\,
	cout => \Add0~6\);

-- Location: FF_X88_Y7_N23
\BitPeriodCounter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~5_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(7));

-- Location: LABCELL_X88_Y7_N24
\Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Add0~1_sumout\ = SUM(( BitPeriodCounter(8) ) + ( GND ) + ( \Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datad => ALT_INV_BitPeriodCounter(8),
	cin => \Add0~6\,
	sumout => \Add0~1_sumout\);

-- Location: FF_X88_Y7_N26
\BitPeriodCounter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Add0~1_sumout\,
	clrn => \ALT_INV_Rst~input_o\,
	sclr => \BitPeriodCounter[8]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => BitPeriodCounter(8));

-- Location: LABCELL_X88_Y7_N48
\Equal0~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = ( BitPeriodCounter(7) & ( !BitPeriodCounter(3) & ( (BitPeriodCounter(8) & (BitPeriodCounter(5) & (!BitPeriodCounter(6) & BitPeriodCounter(4)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000001000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_BitPeriodCounter(8),
	datab => ALT_INV_BitPeriodCounter(5),
	datac => ALT_INV_BitPeriodCounter(6),
	datad => ALT_INV_BitPeriodCounter(4),
	datae => ALT_INV_BitPeriodCounter(7),
	dataf => ALT_INV_BitPeriodCounter(3),
	combout => \Equal0~0_combout\);

-- Location: MLABCELL_X87_Y7_N24
\BaudClk~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \BaudClk~0_combout\ = ( ClocksLeft(2) & ( ClocksLeft(1) & ( (\Equal0~0_combout\ & \Equal0~1_combout\) ) ) ) # ( !ClocksLeft(2) & ( ClocksLeft(1) & ( (\Equal0~0_combout\ & \Equal0~1_combout\) ) ) ) # ( ClocksLeft(2) & ( !ClocksLeft(1) & ( 
-- (\Equal0~0_combout\ & \Equal0~1_combout\) ) ) ) # ( !ClocksLeft(2) & ( !ClocksLeft(1) & ( (\Equal0~0_combout\ & (\Equal0~1_combout\ & ((ClocksLeft(3)) # (ClocksLeft(0))))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000100000011000000110000001100000011000000110000001100000011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClocksLeft(0),
	datab => \ALT_INV_Equal0~0_combout\,
	datac => \ALT_INV_Equal0~1_combout\,
	datad => ALT_INV_ClocksLeft(3),
	datae => ALT_INV_ClocksLeft(2),
	dataf => ALT_INV_ClocksLeft(1),
	combout => \BaudClk~0_combout\);

-- Location: FF_X87_Y7_N25
\BaudClk~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \BaudClk~0_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \BaudClk~reg0_q\);

-- Location: MLABCELL_X87_Y7_N33
\Ready~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Ready~0_combout\ = ( \Ready~reg0_q\ & ( ClocksLeft(3) ) ) # ( !\Ready~reg0_q\ & ( ClocksLeft(3) & ( \Start~input_o\ ) ) ) # ( \Ready~reg0_q\ & ( !ClocksLeft(3) & ( (((ClocksLeft(1)) # (ClocksLeft(2))) # (\Start~input_o\)) # (ClocksLeft(0)) ) ) ) # ( 
-- !\Ready~reg0_q\ & ( !ClocksLeft(3) & ( \Start~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0011001100110011011111111111111100110011001100111111111111111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => ALT_INV_ClocksLeft(0),
	datab => \ALT_INV_Start~input_o\,
	datac => ALT_INV_ClocksLeft(2),
	datad => ALT_INV_ClocksLeft(1),
	datae => \ALT_INV_Ready~reg0_q\,
	dataf => ALT_INV_ClocksLeft(3),
	combout => \Ready~0_combout\);

-- Location: FF_X87_Y7_N34
\Ready~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clk~inputCLKENA0_outclk\,
	d => \Ready~0_combout\,
	clrn => \ALT_INV_Rst~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Ready~reg0_q\);

-- Location: LABCELL_X7_Y1_N3
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


