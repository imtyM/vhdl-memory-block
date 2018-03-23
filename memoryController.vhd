library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity memoryController is 
	port ( 
			 chip_select_LED: out std_logic;
			 
			 chip_select : in std_logic;
			 R_W : in std_logic;
			 read_mode : out std_logic := '0';
			 write_mode: out std_logic := '0');
			 
end memoryController;

architecture controller of memoryController is

begin

	mode : process(chip_select, R_W)
	begin
			chip_select_LED <= chip_select;
			
			read_mode <= R_W;
			write_mode <= not R_W;
	end process mode;
end controller;