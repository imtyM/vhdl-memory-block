library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity RAM is 
	port ( active: in std_logic;
			 data_in: in std_logic_vector(7 downto 0);
			 
			 byte_out : out std_logic_vector(7 downto 0));
end RAM;

architecture control of RAM is
signal byteData : std_logic_vector(7 downto 0) := x"00"; 
begin
byteData <= data_in;
byte_out <= byteData;

end control; 