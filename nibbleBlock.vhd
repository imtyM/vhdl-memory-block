library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity nibbleBlock is 
	port (B_N : in std_logic;			
			data : in std_logic_vector (7 downto 0);
			process_command : in std_logic := '0';
			second_nibble: in std_logic := '0';
			clk: in std_logic;
			
			send_out : out std_logic := '0';
			send_data : out std_logic_vector (3 downto 0)-- goto byte
			);
end nibbleBlock;

architecture control of nibbleBlock is 

signal nibble_data : std_logic_vector (3 downto 0) ;
begin	

		
	send_data <= nibble_data;
	
	save_nibble : process (second_nibble, process_command, clk)
	begin	
		if (clk'event and clk = '1')then
			if (process_command = '1')then 
				nibble_data <= data(7 downto 4);
				send_out <= '1';
			elsif (second_nibble = '1') then
				nibble_data <= data(3 downto 0);
			else 
				send_out <= '0';
				nibble_data <= nibble_data;
			end if;
		end if;	
	end process save_nibble;

			
end control;