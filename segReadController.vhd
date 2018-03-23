library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity segReadController is 
	port (chip_select: in std_logic;
			R_W : in std_logic;
			read_address: in std_logic_vector (3 downto 0);
			B_N : in std_logic;
			byte7: in std_logic_vector(7 downto 0);
			byte6: in std_logic_vector(7 downto 0);
			byte5: in std_logic_vector(7 downto 0);
			byte4: in std_logic_vector(7 downto 0);
			byte3: in std_logic_vector(7 downto 0);
			byte2: in std_logic_vector(7 downto 0);
			byte1: in std_logic_vector(7 downto 0);
			byte0: in std_logic_vector(7 downto 0);
			

			
			debug : out std_logic;
			display0 : out std_logic_vector (7 downto 0) := "00111111";
			
			bit3: out std_logic;
			bit2: out std_logic;
			bit1: out std_logic;
			bit0: out std_logic);
end segReadController;

architecture control of segReadController is
signal currentByte : std_logic_vector (7 downto 0);
begin 

	currentByte <= x"44" when (chip_select = '1' and R_W = '1'  and (read_address = x"0" or read_address = x"1") )else
					byte1 when (chip_select = '1' and R_W = '1'  and (read_address = x"2" or read_address = x"3") )else
					byte3 when (chip_select = '1' and R_W = '1'  and (read_address = x"4" or read_address = x"5") )else
					byte2 when (chip_select = '1' and R_W = '1'  and (read_address = x"6" or read_address = x"7") )else
					byte5 when (chip_select = '1' and R_W = '1'  and (read_address = x"8" or read_address = x"9") )else
					byte4 when (chip_select = '1' and R_W = '1'  and (read_address = x"A" or read_address = x"B") )else
					byte6 when (chip_select = '1' and R_W = '1'  and (read_address = x"C" or read_address = x"D") )else
					byte7 when (chip_select = '1' and R_W = '1'  and (read_address = x"E" or read_address = x"F") )else
					x"00";
					
	display0 <= currentByte when (B_N = '1')else
					x"00";
	
	bit0 <= currentByte(4) when (B_N = '0' and (read_address = x"0" or read_address = x"2" or read_address = x"4" or read_address = x"6" or
															  read_address = x"8" or read_address = x"A" or read_address = x"C" or read_address = x"E"))else
			  currentByte(0);		  			  
	bit1 <= currentByte(5) when (B_N = '0' and (read_address = x"0" or read_address = x"2" or read_address = x"4" or read_address = x"6" or
															  read_address = x"8" or read_address = x"A" or read_address = x"C" or read_address = x"E"))else
			  currentByte(1);
	bit2 <= currentByte(6) when (B_N = '0' and (read_address = x"0" or read_address = x"2" or read_address = x"4" or read_address = x"6" or
															  read_address = x"8" or read_address = x"A" or read_address = x"C" or read_address = x"E"))else
			  currentByte(2);
	bit3 <= currentByte(7) when (B_N = '0' and (read_address = x"0" or read_address = x"2" or read_address = x"4" or read_address = x"6" or
															  read_address = x"8" or read_address = x"A" or read_address = x"C" or read_address = x"E"))else
			  currentByte(3);
	

	
end control;
			
