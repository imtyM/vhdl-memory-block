library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


entity ps2Control is

	port 
	(
		clk						: in std_logic;
		data	    				: in std_logic;
		
		
		key_scan_code			: out std_logic_vector(0 to 7);
		key_pressed				: out std_logic := '0'
	);

end ps2Control;

architecture control of ps2control is

	signal packet :	std_logic_vector(0  to 7);

begin

	process (clk)
		variable k : integer range 0 to 11 :=0;
	begin
		if (falling_edge(clk)) then
				if(k>0 and k<9) then
				packet(7-k+1)<= data;
				end if;
				if(k=10) then
					if(packet=x"F0") then
						key_pressed <='0';
					else
						key_scan_code <= packet;
						key_pressed <= '1';
					end if;
				end if;
				if (k=11) then
					k :=0;
					key_pressed <='0';
				end if;
				k := k+1;
		end if;
	end process;


end control;