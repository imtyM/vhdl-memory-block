library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity MemoryDecoderSeg is 
	port (
			line0: in std_logic;
			line1: in std_logic;
			line2: in std_logic;
			line3: in std_logic;
			line4: in std_logic;
			line5: in std_logic;
			line6: in std_logic;
			line7: in std_logic;
	
	
			RAM1: in std_logic_vector(7 downto 0);
		   RAM2: in std_logic_vector(7 downto 0);
			RAM3: in std_logic_vector(7 downto 0);
			
			
			
			display0 : out std_logic_vector (7 downto 0) := "00111111";
			display1 : out std_logic_vector (7 downto 0) := "01111111";
			display2 : out std_logic_vector (7 downto 0) := "01111111";
			display3 : out std_logic_vector (7 downto 0) := "01111111");
end MemoryDecoderSeg;

architecture control of MemoryDecoderSeg is
begin 

	display0 <= x"41" when (line0 = '1')else
					x"4A" when (line1 = '1')else
					x"4C" when (line2 = '1')else
					x"4E" when (line3 = '1')else
					x"55" when (line4 = '1')else
					RAM1 when (line5 = '1')else
					RAM2 when (line6 = '1')else
					RAM3 when (line7 = '1')else
					x"00";

	
end control;
			
