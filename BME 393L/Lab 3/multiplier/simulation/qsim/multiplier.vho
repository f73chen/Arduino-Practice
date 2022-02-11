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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "02/11/2022 10:53:01"

-- 
-- Device: Altera 5CGXFC5C6F27C7 Package FBGA672
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	multiplier IS
    PORT (
	SW : IN std_logic_vector(9 DOWNTO 0);
	LEDG : OUT std_logic_vector(7 DOWNTO 0)
	);
END multiplier;

-- Design Ports Information
-- SW[4]	=>  Location: PIN_W11,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[5]	=>  Location: PIN_AB10,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_H9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AC9,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[6]	=>  Location: PIN_V10,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AE10,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[7]	=>  Location: PIN_AC10,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[8]	=>  Location: PIN_Y11,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[2]	=>  Location: PIN_AD13,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[3]	=>  Location: PIN_AC8,	 I/O Standard: 1.2 V,	 Current Strength: Default
-- SW[9]	=>  Location: PIN_AE19,	 I/O Standard: 1.2 V,	 Current Strength: Default


ARCHITECTURE structure OF multiplier IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_SW : std_logic_vector(9 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \out1~0_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \adder2|Add0~1_sumout\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \adder2|Add0~29_sumout\ : std_logic;
SIGNAL \adder2|Add0~2\ : std_logic;
SIGNAL \adder2|Add0~5_sumout\ : std_logic;
SIGNAL \adder2|Add0~30\ : std_logic;
SIGNAL \adder2|Add0~33_sumout\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \adder1|Add0~1_sumout\ : std_logic;
SIGNAL \adder2|Add0~6\ : std_logic;
SIGNAL \adder2|Add0~9_sumout\ : std_logic;
SIGNAL \adder1|Add0~2\ : std_logic;
SIGNAL \adder1|Add0~5_sumout\ : std_logic;
SIGNAL \adder2|Add0~34\ : std_logic;
SIGNAL \adder2|Add0~37_sumout\ : std_logic;
SIGNAL \adder2|Add0~10\ : std_logic;
SIGNAL \adder2|Add0~13_sumout\ : std_logic;
SIGNAL \adder2|Add0~38\ : std_logic;
SIGNAL \adder2|Add0~41_sumout\ : std_logic;
SIGNAL \adder1|Add0~6\ : std_logic;
SIGNAL \adder1|Add0~9_sumout\ : std_logic;
SIGNAL \adder2|Add0~14\ : std_logic;
SIGNAL \adder2|Add0~17_sumout\ : std_logic;
SIGNAL \adder1|Add0~10\ : std_logic;
SIGNAL \adder1|Add0~13_sumout\ : std_logic;
SIGNAL \adder2|Add0~42\ : std_logic;
SIGNAL \adder2|Add0~45_sumout\ : std_logic;
SIGNAL \adder2|Add0~18\ : std_logic;
SIGNAL \adder2|Add0~21_sumout\ : std_logic;
SIGNAL \adder1|Add0~14\ : std_logic;
SIGNAL \adder1|Add0~17_sumout\ : std_logic;
SIGNAL \adder2|Add0~22\ : std_logic;
SIGNAL \adder2|Add0~25_sumout\ : std_logic;
SIGNAL \ALT_INV_SW[9]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[3]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[8]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[7]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[6]~input_o\ : std_logic;
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \adder1|ALT_INV_Add0~17_sumout\ : std_logic;
SIGNAL \adder1|ALT_INV_Add0~13_sumout\ : std_logic;
SIGNAL \adder2|ALT_INV_Add0~45_sumout\ : std_logic;
SIGNAL \adder1|ALT_INV_Add0~9_sumout\ : std_logic;
SIGNAL \adder2|ALT_INV_Add0~41_sumout\ : std_logic;
SIGNAL \adder1|ALT_INV_Add0~5_sumout\ : std_logic;
SIGNAL \adder2|ALT_INV_Add0~37_sumout\ : std_logic;
SIGNAL \adder1|ALT_INV_Add0~1_sumout\ : std_logic;
SIGNAL \adder2|ALT_INV_Add0~33_sumout\ : std_logic;
SIGNAL \adder2|ALT_INV_Add0~29_sumout\ : std_logic;

BEGIN

ww_SW <= SW;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_SW[9]~input_o\ <= NOT \SW[9]~input_o\;
\ALT_INV_SW[3]~input_o\ <= NOT \SW[3]~input_o\;
\ALT_INV_SW[2]~input_o\ <= NOT \SW[2]~input_o\;
\ALT_INV_SW[8]~input_o\ <= NOT \SW[8]~input_o\;
\ALT_INV_SW[7]~input_o\ <= NOT \SW[7]~input_o\;
\ALT_INV_SW[1]~input_o\ <= NOT \SW[1]~input_o\;
\ALT_INV_SW[6]~input_o\ <= NOT \SW[6]~input_o\;
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\adder1|ALT_INV_Add0~17_sumout\ <= NOT \adder1|Add0~17_sumout\;
\adder1|ALT_INV_Add0~13_sumout\ <= NOT \adder1|Add0~13_sumout\;
\adder2|ALT_INV_Add0~45_sumout\ <= NOT \adder2|Add0~45_sumout\;
\adder1|ALT_INV_Add0~9_sumout\ <= NOT \adder1|Add0~9_sumout\;
\adder2|ALT_INV_Add0~41_sumout\ <= NOT \adder2|Add0~41_sumout\;
\adder1|ALT_INV_Add0~5_sumout\ <= NOT \adder1|Add0~5_sumout\;
\adder2|ALT_INV_Add0~37_sumout\ <= NOT \adder2|Add0~37_sumout\;
\adder1|ALT_INV_Add0~1_sumout\ <= NOT \adder1|Add0~1_sumout\;
\adder2|ALT_INV_Add0~33_sumout\ <= NOT \adder2|Add0~33_sumout\;
\adder2|ALT_INV_Add0~29_sumout\ <= NOT \adder2|Add0~29_sumout\;

-- Location: IOOBUF_X10_Y61_N42
\LEDG[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \out1~0_combout\,
	devoe => ww_devoe,
	o => ww_LEDG(0));

-- Location: IOOBUF_X10_Y61_N59
\LEDG[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~1_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(1));

-- Location: IOOBUF_X10_Y61_N76
\LEDG[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~5_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(2));

-- Location: IOOBUF_X10_Y61_N93
\LEDG[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~9_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(3));

-- Location: IOOBUF_X21_Y61_N36
\LEDG[4]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~13_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(4));

-- Location: IOOBUF_X21_Y61_N53
\LEDG[5]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~17_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(5));

-- Location: IOOBUF_X19_Y61_N2
\LEDG[6]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~21_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(6));

-- Location: IOOBUF_X19_Y61_N19
\LEDG[7]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \adder2|Add0~25_sumout\,
	devoe => ww_devoe,
	o => ww_LEDG(7));

-- Location: IOIBUF_X17_Y0_N75
\SW[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

-- Location: IOIBUF_X14_Y0_N35
\SW[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: MLABCELL_X14_Y1_N15
\out1~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \out1~0_combout\ = ( \SW[0]~input_o\ & ( \SW[6]~input_o\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000010101010101010100000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[6]~input_o\,
	datae => \ALT_INV_SW[0]~input_o\,
	combout => \out1~0_combout\);

-- Location: IOIBUF_X12_Y0_N52
\SW[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

-- Location: IOIBUF_X36_Y0_N52
\SW[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: LABCELL_X15_Y1_N30
\adder2|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~1_sumout\ = SUM(( (\SW[0]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[1]~input_o\ & \SW[6]~input_o\) ) + ( !VCC ))
-- \adder2|Add0~2\ = CARRY(( (\SW[0]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[1]~input_o\ & \SW[6]~input_o\) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000000001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datab => \ALT_INV_SW[7]~input_o\,
	datac => \ALT_INV_SW[1]~input_o\,
	dataf => \ALT_INV_SW[6]~input_o\,
	cin => GND,
	sumout => \adder2|Add0~1_sumout\,
	cout => \adder2|Add0~2\);

-- Location: IOIBUF_X10_Y0_N58
\SW[8]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

-- Location: IOIBUF_X34_Y0_N35
\SW[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

-- Location: LABCELL_X15_Y1_N0
\adder2|Add0~29\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~29_sumout\ = SUM(( (\SW[1]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[6]~input_o\ & \SW[2]~input_o\) ) + ( !VCC ))
-- \adder2|Add0~30\ = CARRY(( (\SW[1]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[6]~input_o\ & \SW[2]~input_o\) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111000000000000000000000001000100010001",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[1]~input_o\,
	datab => \ALT_INV_SW[7]~input_o\,
	datac => \ALT_INV_SW[6]~input_o\,
	dataf => \ALT_INV_SW[2]~input_o\,
	cin => GND,
	sumout => \adder2|Add0~29_sumout\,
	cout => \adder2|Add0~30\);

-- Location: LABCELL_X15_Y1_N33
\adder2|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~5_sumout\ = SUM(( \adder2|Add0~29_sumout\ ) + ( (\SW[0]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~2\ ))
-- \adder2|Add0~6\ = CARRY(( \adder2|Add0~29_sumout\ ) + ( (\SW[0]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111110101111101000000000000000000000000011111111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[0]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	datad => \adder2|ALT_INV_Add0~29_sumout\,
	cin => \adder2|Add0~2\,
	sumout => \adder2|Add0~5_sumout\,
	cout => \adder2|Add0~6\);

-- Location: LABCELL_X15_Y1_N3
\adder2|Add0~33\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~33_sumout\ = SUM(( (\SW[2]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[1]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~30\ ))
-- \adder2|Add0~34\ = CARRY(( (\SW[2]~input_o\ & \SW[7]~input_o\) ) + ( (\SW[1]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~30\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111010101000000000000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[1]~input_o\,
	datac => \ALT_INV_SW[2]~input_o\,
	datad => \ALT_INV_SW[7]~input_o\,
	dataf => \ALT_INV_SW[8]~input_o\,
	cin => \adder2|Add0~30\,
	sumout => \adder2|Add0~33_sumout\,
	cout => \adder2|Add0~34\);

-- Location: IOIBUF_X14_Y0_N52
\SW[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

-- Location: IOIBUF_X50_Y0_N35
\SW[9]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

-- Location: MLABCELL_X14_Y1_N30
\adder1|Add0~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder1|Add0~1_sumout\ = SUM(( (\SW[3]~input_o\ & \SW[6]~input_o\) ) + ( (\SW[0]~input_o\ & \SW[9]~input_o\) ) + ( !VCC ))
-- \adder1|Add0~2\ = CARRY(( (\SW[3]~input_o\ & \SW[6]~input_o\) ) + ( (\SW[0]~input_o\ & \SW[9]~input_o\) ) + ( !VCC ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111001111110000000000000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datab => \ALT_INV_SW[0]~input_o\,
	datac => \ALT_INV_SW[9]~input_o\,
	datad => \ALT_INV_SW[6]~input_o\,
	cin => GND,
	sumout => \adder1|Add0~1_sumout\,
	cout => \adder1|Add0~2\);

-- Location: LABCELL_X15_Y1_N36
\adder2|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~9_sumout\ = SUM(( \adder2|Add0~33_sumout\ ) + ( \adder1|Add0~1_sumout\ ) + ( \adder2|Add0~6\ ))
-- \adder2|Add0~10\ = CARRY(( \adder2|Add0~33_sumout\ ) + ( \adder1|Add0~1_sumout\ ) + ( \adder2|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000101010101010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder2|ALT_INV_Add0~33_sumout\,
	datac => \adder1|ALT_INV_Add0~1_sumout\,
	cin => \adder2|Add0~6\,
	sumout => \adder2|Add0~9_sumout\,
	cout => \adder2|Add0~10\);

-- Location: MLABCELL_X14_Y1_N33
\adder1|Add0~5\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder1|Add0~5_sumout\ = SUM(( (\SW[3]~input_o\ & \SW[7]~input_o\) ) + ( GND ) + ( \adder1|Add0~2\ ))
-- \adder1|Add0~6\ = CARRY(( (\SW[3]~input_o\ & \SW[7]~input_o\) ) + ( GND ) + ( \adder1|Add0~2\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[7]~input_o\,
	cin => \adder1|Add0~2\,
	sumout => \adder1|Add0~5_sumout\,
	cout => \adder1|Add0~6\);

-- Location: LABCELL_X15_Y1_N6
\adder2|Add0~37\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~37_sumout\ = SUM(( (\SW[1]~input_o\ & \SW[9]~input_o\) ) + ( (\SW[2]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~34\ ))
-- \adder2|Add0~38\ = CARRY(( (\SW[1]~input_o\ & \SW[9]~input_o\) ) + ( (\SW[2]~input_o\ & \SW[8]~input_o\) ) + ( \adder2|Add0~34\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111100110000000000000000000000000000001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[2]~input_o\,
	datac => \ALT_INV_SW[1]~input_o\,
	datad => \ALT_INV_SW[9]~input_o\,
	dataf => \ALT_INV_SW[8]~input_o\,
	cin => \adder2|Add0~34\,
	sumout => \adder2|Add0~37_sumout\,
	cout => \adder2|Add0~38\);

-- Location: LABCELL_X15_Y1_N39
\adder2|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~13_sumout\ = SUM(( \adder2|Add0~37_sumout\ ) + ( \adder1|Add0~5_sumout\ ) + ( \adder2|Add0~10\ ))
-- \adder2|Add0~14\ = CARRY(( \adder2|Add0~37_sumout\ ) + ( \adder1|Add0~5_sumout\ ) + ( \adder2|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \adder1|ALT_INV_Add0~5_sumout\,
	datac => \adder2|ALT_INV_Add0~37_sumout\,
	cin => \adder2|Add0~10\,
	sumout => \adder2|Add0~13_sumout\,
	cout => \adder2|Add0~14\);

-- Location: LABCELL_X15_Y1_N9
\adder2|Add0~41\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~41_sumout\ = SUM(( (\SW[2]~input_o\ & \SW[9]~input_o\) ) + ( GND ) + ( \adder2|Add0~38\ ))
-- \adder2|Add0~42\ = CARRY(( (\SW[2]~input_o\ & \SW[9]~input_o\) ) + ( GND ) + ( \adder2|Add0~38\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_SW[2]~input_o\,
	datad => \ALT_INV_SW[9]~input_o\,
	cin => \adder2|Add0~38\,
	sumout => \adder2|Add0~41_sumout\,
	cout => \adder2|Add0~42\);

-- Location: MLABCELL_X14_Y1_N36
\adder1|Add0~9\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder1|Add0~9_sumout\ = SUM(( (\SW[3]~input_o\ & \SW[8]~input_o\) ) + ( GND ) + ( \adder1|Add0~6\ ))
-- \adder1|Add0~10\ = CARRY(( (\SW[3]~input_o\ & \SW[8]~input_o\) ) + ( GND ) + ( \adder1|Add0~6\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000010100000101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datac => \ALT_INV_SW[8]~input_o\,
	cin => \adder1|Add0~6\,
	sumout => \adder1|Add0~9_sumout\,
	cout => \adder1|Add0~10\);

-- Location: LABCELL_X15_Y1_N42
\adder2|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~17_sumout\ = SUM(( \adder2|Add0~41_sumout\ ) + ( \adder1|Add0~9_sumout\ ) + ( \adder2|Add0~14\ ))
-- \adder2|Add0~18\ = CARRY(( \adder2|Add0~41_sumout\ ) + ( \adder1|Add0~9_sumout\ ) + ( \adder2|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111100001111000000000000000000000011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \adder2|ALT_INV_Add0~41_sumout\,
	datac => \adder1|ALT_INV_Add0~9_sumout\,
	cin => \adder2|Add0~14\,
	sumout => \adder2|Add0~17_sumout\,
	cout => \adder2|Add0~18\);

-- Location: MLABCELL_X14_Y1_N39
\adder1|Add0~13\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder1|Add0~13_sumout\ = SUM(( (\SW[3]~input_o\ & \SW[9]~input_o\) ) + ( GND ) + ( \adder1|Add0~10\ ))
-- \adder1|Add0~14\ = CARRY(( (\SW[3]~input_o\ & \SW[9]~input_o\) ) + ( GND ) + ( \adder1|Add0~10\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000001010101",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_SW[3]~input_o\,
	datad => \ALT_INV_SW[9]~input_o\,
	cin => \adder1|Add0~10\,
	sumout => \adder1|Add0~13_sumout\,
	cout => \adder1|Add0~14\);

-- Location: LABCELL_X15_Y1_N12
\adder2|Add0~45\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~45_sumout\ = SUM(( GND ) + ( GND ) + ( \adder2|Add0~42\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \adder2|Add0~42\,
	sumout => \adder2|Add0~45_sumout\);

-- Location: LABCELL_X15_Y1_N45
\adder2|Add0~21\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~21_sumout\ = SUM(( \adder2|Add0~45_sumout\ ) + ( \adder1|Add0~13_sumout\ ) + ( \adder2|Add0~18\ ))
-- \adder2|Add0~22\ = CARRY(( \adder2|Add0~45_sumout\ ) + ( \adder1|Add0~13_sumout\ ) + ( \adder2|Add0~18\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000101010101010101000000000000000000000111100001111",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \adder1|ALT_INV_Add0~13_sumout\,
	datac => \adder2|ALT_INV_Add0~45_sumout\,
	cin => \adder2|Add0~18\,
	sumout => \adder2|Add0~21_sumout\,
	cout => \adder2|Add0~22\);

-- Location: MLABCELL_X14_Y1_N42
\adder1|Add0~17\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder1|Add0~17_sumout\ = SUM(( GND ) + ( GND ) + ( \adder1|Add0~14\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	cin => \adder1|Add0~14\,
	sumout => \adder1|Add0~17_sumout\);

-- Location: LABCELL_X15_Y1_N48
\adder2|Add0~25\ : cyclonev_lcell_comb
-- Equation(s):
-- \adder2|Add0~25_sumout\ = SUM(( GND ) + ( \adder1|Add0~17_sumout\ ) + ( \adder2|Add0~22\ ))

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000110011001100110000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \adder1|ALT_INV_Add0~17_sumout\,
	cin => \adder2|Add0~22\,
	sumout => \adder2|Add0~25_sumout\);

-- Location: IOIBUF_X10_Y0_N41
\SW[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

-- Location: IOIBUF_X12_Y0_N35
\SW[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

-- Location: LABCELL_X13_Y23_N3
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


