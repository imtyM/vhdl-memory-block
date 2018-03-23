library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity segControl is 
	port ( seg_in : in std_logic_vector (7 downto 0);
			 seg_out : out std_logic_vector (7 downto 0):= "00111111");
end segControl;

architecture control of segControl is
signal data :	std_logic_vector	(7 downto 0) := "11111111";
begin

with seg_in select 
	data <= 	x"08" when x"41",--A
				x"03" when x"42",--B
				x"27" when x"43",--C
				x"21" when x"44",--D
				x"06" when x"45",--E
				x"0E" when x"46",--F
				x"10" when x"47",--G
				x"09" when x"48",--H
				x"79" when x"49",--I
				x"71" when x"4A",--J
				x"0F" when x"4B",--K
				x"47" when x"4C",--L
				x"49" when x"4D",--M
				x"2B" when x"4E",--N
				x"23" when x"4F",--O
				x"0C" when x"50",--P
				x"18" when x"51",--Q
				x"4E" when x"52",--R
				x"12" when x"53",--S
				x"07" when x"54",--T
				x"63" when x"55",--U
				x"4D" when x"56",--V
				x"2D" when x"57",--W
				x"36" when x"58",--X
				x"11" when x"59",--Y
				x"24" when x"5A",--Z
				x"08" when x"0A",--A
				x"03" when x"0B",--B
				x"27" when x"0C",--C
				x"21" when x"0D",--D
				x"06" when x"0E",--E
				x"0E" when x"0F",--F
				x"40" when x"30",--0
				x"79" when x"31",--1
				x"3F" when others;
		seg_out <= data;
end control;