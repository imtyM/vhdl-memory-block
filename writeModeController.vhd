library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity writeModeController is

		port(clk : in std_logic;
			  address: in std_logic_vector (3 downto 0);
			  process_command: in std_logic;
			  B_N: in std_logic;
			  write_active: in std_logic;
			  chip_select: in std_logic;
			  
			  key_in : in std_logic_vector (7 downto 0);
			  
			  byteLed : out std_logic;
			  debug_LED: out std_logic;
			  B_N_LED: out std_logic;
			  
			  process_byte:out std_logic;
			  write_address: out std_logic_vector (3 downto 0) := "0000";
			  key_out: out std_logic_vector(7 downto 0));
			  
end writeModeController;

architecture control of writeModeController is 
signal currentKey : std_logic_vector (7 downto 0); 
begin
		
		B_N_LED <= B_N;
		key_out <= key_in when (write_active = '1')else
						x"00";

		writeByte : process (process_command)
		begin
			if (chip_select = '1' and B_N = '1' and write_active = '1' and process_command = '0' and key_in/=x"00")then
				if (address = "0000" or address = "0001")then
					write_address <= "0000";--1
				elsif(address = "0010" or address = "0011" )then
					write_address <= "0010";--2
				elsif(address = "0100" or address = "0101" )then
					write_address <= "0100";--3
				elsif(address = "0110" or address = "0111" )then
					write_address <= "0110";--4
				elsif(address = "1000" or address = "1001" )then
					write_address <= "1000";--5
				elsif(address = "1010" or address = "1011" )then
					write_address <= "1010";--6
				elsif(address = "1100" or address = "1101" )then
					write_address <= "1100";--7
				elsif(address = "1110" or address = "1111" )then
					write_address <= "1110";--8
					else
					write_address <= "0000";
				end if;
				byteLed <= '1';
				process_byte <='1';
			else 
				byteLed <= '0';
				process_byte <= '0';
				debug_LED <= '0';
			end if;
		end process writeByte;
		

end control;
			  