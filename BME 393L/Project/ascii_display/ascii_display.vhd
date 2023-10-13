library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment is port(
			data_in:		in std_logic_vector(3 downto 0);		-- The 4 bit data to be displayed
			blanking:	in std_logic;							-- Blank the output if this is 1
			segments_out: out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end entity seven_segment;

architecture behavioral of seven_segment is
-- Add your signals here, if any needed 
begin
-- Complete your code here 
		with blanking & data_in select		-- 7-segment bits are a to g but the lsb is a
		segments_out(6 downto 0) <=	"1000000" when "00000",		-- 0
									"1111001" when "00001",		-- 1
									"0100100" when "00010", 	-- 2
									"0110000" when "00011", 	-- 3
									"0011001" when "00100",		-- 4
									"0010010" when "00101", 	-- 5
									"0000010" when "00110", 	-- 6
									"1111000" when "00111",		-- 7
									"0000000" when "01000", 	-- 8
									"0010000" when "01001",		-- 9
									"0001000" when "01010",		-- a
									"0000011" when "01011",		-- b
									"0100111" when "01100",		-- c
									"0100001" when "01101",		-- d
									"0000110" when "01110",		-- e
									"0001110" when "01111",		-- f 
									"1111111" when others; 		-- blanks the seven-segment display 
end architecture behavioral;

-- This program shows ascii values on HEX displays once KEY(0) pressed 
-- Written by Rasoul Keshavarzi, Winter 2022 term 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ascii_display is 
	port( 
			CLOCK_50_B5B:	in  std_logic;    -- 50MHz clock on the board 
			KEY: 				in  std_logic_vector(3 downto 0); 
			SW:				in  std_logic_vector(3 downto 0); 
		--	GPIO:				out std_logic_vector(35 downto 0); 
			hex0, hex1: 	out std_logic_vector(6 downto 0); 
			hex2, hex3: 	out std_logic_vector(6 downto 0); 
			LEDR:				out unsigned (9 downto 0)  	-- Red LEDs 
		); 
end entity ascii_display; 

Architecture main of ascii_display is 

constant message_length: integer := 29; 	-- This is the length of the string 
constant message: string(1 to message_length) := "BME-393L DIGITAL SYSTEMS LAB ";

component seven_segment is port(
			data_in:		in std_logic_vector(3 downto 0);		-- The 4 bit data to be displayed
			blanking:	in std_logic;							-- Blank the output if this is 1
			segments_out: out std_logic_vector(6 downto 0) );	-- 7 bits out to a 7-segment display
end component seven_segment;

signal one_char: character := ' '; 
signal integer_one_char: integer;
signal row_bits: std_logic_vector(47 downto 0); 
signal ascii: std_logic_vector(6 downto 0); 	-- ASCII code 
signal ascii_2: std_logic_vector(6 downto 0); 
signal char_pntr: unsigned(5 downto 0) := "000001"; 	-- Pointing to first character 

begin -- Architecture starts here 
one_char <= message(to_integer(char_pntr)); 
integer_one_char <= character'pos(one_char); 
ascii <= std_logic_vector(to_unsigned(integer_one_char, 7)); -- std_logic_vector
ascii_2 <= ascii when rising_edge(KEY(0)); 

char_pntr <= char_pntr + 1 when rising_edge(KEY(0)); 

-- The following code implements a lookup table for characters and their ASCII codes 
row_bits <= "011111101001000010010000100100000111111000000000" when ascii = "1000001" else -- A (0x41)
				"111111101001001010010010100100100110110000000000"	when ascii = "1000010" else -- B (0x42)
				"011111001000001010000010100000100100010000000000"	when ascii = "1000011" else -- C (0x43)
				"111111101000001010000010100000100111110000000000"	when ascii = "1000100" else -- D (0x44)
				"111111101001001010010010100100101000001000000000"	when ascii = "1000101" else -- E (0x45)
				"111111101001000010010000100100001000000000000000"	when ascii = "1000110" else -- F (0x46)
				"011111001000001010001010100010100100111000000000"	when ascii = "1000111" else -- G (0x47)
				"111111100001000000010000000100001111111000000000"	when ascii = "1001000" else -- H (0x48)
				"000000001000001011111110100000100000000000000000"	when ascii = "1001001" else -- I (0x49)
				"000001000000001000000010000000101111110000000000"	when ascii = "1001010" else -- J (0x4A)
				"111111100001000000101000010001001000001000000000"	when ascii = "1001011" else -- K (0x4B)
				"111111100000001000000010000000100000001000000000"	when ascii = "1001100" else -- L (0x4C)
				"111111100100000000110000010000001111111000000000"	when ascii = "1001101" else -- M (0x4D)
				"111111100010000000010000000010001111111000000000"	when ascii = "1001110" else -- N (0x4E)
				"011111001000001010000010100000100111110000000000"	when ascii = "1001111" else -- O (0x4F)
				"111111101000100010001000100010000111000000000000"	when ascii = "1010000" else -- P (0x50)
				"011111001000001010001010100001000111101000000000"	when ascii = "1010001" else -- Q (0x51)
				"111111101001000010011000100101000110001000000000"	when ascii = "1010010" else -- R (0x52)
				"011001001001001010010010100100100100110000000000"	when ascii = "1010011" else -- S (0x53)
				"100000001000000011111110100000001000000000000000"	when ascii = "1010100" else -- T (0x54)
				"111111000000001000000010000000101111110000000000"	when ascii = "1010101" else -- U (0x55)
				"111110000000010000000010000001001111100000000000"	when ascii = "1010110" else -- V (0x56)
				"111111100000010000011000000001001111111000000000"	when ascii = "1010111" else -- W (0x57)
				"110001100010100000010000001010001100011000000000"	when ascii = "1011000" else -- X (0x58)
				"110000000010000000011110001000001100000000000000"	when ascii = "1011001" else -- Y (0x59)
				"100001101000101010010010101000101100001000000000"	when ascii = "1011010" else -- Z (0x5A)
				"011111001000101010010010101000100111110000000000"	when ascii = "0110000" else -- 0 (0x30)
				"000000000100001011111110000000100000000000000000"	when ascii = "0110001" else -- 1 (0x31)
				"010001101000101010010010100100100110000000000000"	when ascii = "0110010" else -- 2 (0x32)
				"010001001000001010010010100100100110110000000000"	when ascii = "0110011" else -- 3 (0x33)
				"000110000010100001001000111111100000100000000000"	when ascii = "0110100" else -- 4 (0x34)
				"111001001010001010100010101000101001110000000000"	when ascii = "0110101" else -- 5 (0x35)
				"001111000101001010010010100100101000110000000000"	when ascii = "0110110" else -- 6 (0x36)
				"100000001000111010010000101000001100000000000000"	when ascii = "0110111" else -- 7 (0x37)
				"011011001001001010010010100100100110110000000000"	when ascii = "0111000" else -- 8 (0x38)
				"011001001001001010010010100100100111110000000000"	when ascii = "0111001" else -- 9 (0x39)
				"000000000000000000000000000000000000000000000000"	when ascii = "0100000" else -- Blank (0x20)
				"000100000001000000010000000100000001000000000000"	when ascii = "0101101" else -- Dash (0x2D)
				"100100101001001010010010100100101001001000000000"; 							-- Error 

hex0_insta: entity work.seven_segment(behavioral) port map(ascii(3 downto 0), '0', hex0); 
hex1_insta: entity work.seven_segment(behavioral) port map('0' & ascii(6 downto 4), '0', hex1); 
hex2_insta: entity work.seven_segment(behavioral) port map(ascii_2(3 downto 0), '0', hex2); 
hex3_insta: entity work.seven_segment(behavioral) port map('0' & ascii_2(6 downto 4), '0', hex3); 
end architecture main; 
