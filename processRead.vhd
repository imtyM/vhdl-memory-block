library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

entity processReadWrite is 
	
	port ( process_nibble : in std_logic;
			 process_byte: in std_logic;
			 
			 nibble_in: std_logic_vector(3 downto 0);
			 byte_in: std_logic_vector (7 downto 0);
			 
			 write_address : in std_logic_vector (3 downto 0);

			 R_W : out std_logic;
			 
			 process_read_LED : out std_logic := '0';
			 write_byte: out std_logic := '0';
			 
			 nibbleAdd3 : out std_logic;
			 nibbleAdd2 : out std_logic;
			 nibbleAdd1 : out std_logic;
			 nibbleAdd0 : out std_logic;
			 data_out: out std_logic_vector (7 downto 0));
			 
end processReadWrite;

architecture control of processReadWrite is
signal c : integer range 0 to 255;
signal tempAdd : std_logic_vector(3 downto 0);
begin
R_W <= '0';
data_out <= byte_in;

nibbleAdd0 <= write_address(3);
nibbleAdd1 <= write_address(2);
nibbleAdd2 <= write_address(1);
nibbleAdd3 <= write_address(0);

write_byte <= process_byte;
process_read_LED <= process_byte;

		
end control;