library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity byteBlock is 
	port ( nibble0 : in std_logic_vector(3 downto 0);
			 nibble1 : in std_logic_vector(3 downto 0);
			 
			 byte_out : out std_logic_vector(7 downto 0));
end byteBlock;

architecture control of byteBlock is
signal byteData : std_logic_vector(7 downto 0) := x"00"; 
begin

byteData(7) <= nibble1(3);
byteData(6) <= nibble1(2);
byteData(5) <= nibble1(1);
byteData(4) <= nibble1(0);
byteData(3) <= nibble0(3);
byteData(2) <= nibble0(2);
byteData(1) <= nibble0(1);
byteData(0) <= nibble0(0);

byte_out <= byteData;

end control; 