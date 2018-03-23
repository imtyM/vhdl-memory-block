library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity readModeController is 
	port (
			address_x : in std_logic_vector (1 downto 0) := "00";
			address_y : in std_logic_vector (1 downto 0) := "00";
			
			read_active : in std_logic;
			
			active_LED: out std_logic;		
			read_address: out std_logic_vector (3 downto 0));
end readModeController;

architecture control of readModeController is
signal nibbleAddress : std_logic_vector (3 downto 0);
begin
	nibbleAddress(0) <= address_y(0);
	nibbleAddress(1) <= address_y(1);
	nibbleAddress(2) <= address_x(0);
	nibbleAddress(3) <= address_x(1);
	read_address <= nibbleAddress;
	
	active_LED <= read_active;

end control;
		