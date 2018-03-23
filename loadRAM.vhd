library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity loadRAM is 
port (
		RAM1: out std_logic_vector(7 downto 0);
		RAM2: out std_logic_vector(7 downto 0);
		RAM3: out std_logic_vector(7 downto 0)
		
);
end loadRAM;

architecture control of loadRAM is 
begin
		RAM1 <= x"4F";
		RAM2 <= x"50";
		RAM3 <= x"53";
end control;