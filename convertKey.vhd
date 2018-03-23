library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity convertKey is

	port 
	(
		scan	   : in std_logic_vector	(7 downto 0);
		ascii	   : out std_logic_vector (7 downto 0);
		
		valid_key_LED : out std_logic
	);

end convertKey;

architecture control of convertKey is
signal packet :	std_logic_vector	(7 downto 0);
begin

	with scan select 
	packet <= x"41" when x"1C",--A
				x"42" when x"32",--B
				x"43" when x"21",--C
				x"44" when x"23",--D
				x"45" when x"24",--E
				x"46" when x"2B",--F
				x"47" when x"34",--G
				x"48" when x"33",--H
				x"49" when x"43",--I
				x"4A" when x"3B",--J
				x"4B" when x"42",--K
				x"4C" when x"4B",--L
				x"4D" when x"3A",--M
				x"4E" when x"31",--N
				x"4F" when x"44",--O
				x"50" when x"4D",--P
				x"51" when x"15",--Q
				x"52" when x"2D",--R
				x"53" when x"1B",--S
				x"54" when x"2C",--T
				x"55" when x"3C",--U
				x"56" when x"2A",--V
				x"57" when x"1D",--W
				x"58" when x"22",--X
				x"59" when x"35",--Y
				x"5A" when x"1A",--Z
				x"30" when x"45",--0
				x"31" when x"16",--1
 				x"00" when others;
		
	valid_key_LED <= '0' when (packet =x"00") else
							'1';
		
	ascii <= packet;
end control;
