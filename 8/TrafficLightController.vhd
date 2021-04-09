library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TrafficLightController is
	port ( clk, rst : in std_logic;
	green, yellow, red: out std_logic_vector(3 downto 0));
end entity;

architecture behave of TrafficLightController is
begin
	process(clk)
	variable cnt1 :natural range 0 to 1 := 0; --cnt1 0 means green now, cnt1 1 means yellow now
	variable cnt2 :natural range 0 to 4 := 0; --cnt2 is to count upto the times
	variable activelane : natural range 0 to 3 := 0; --current lane where red not there
	
	begin
		if(rising_edge(clk)) then
			if(cnt1 = 0)
				if(cnt2 < 4)
					cnt2 := cnt2+1;
				else
					cnt2 := 0;
					cnt1 := 1;
				end if;
			else
				if(cnt2 < 1)
					cnt2 := cnt2+1;
				else
					cnt2 := 0;
					cnt1 := 0;
					if(activelane = 3)
						activelane := 0;
					else 
						activelane := activelane + 1;
					end if;
				end if;
			end if;
			
			for i in 0 to 3 loop
				if(i = activelane)
					if(cnt1 = 0)
						green(i) <= '1';
						yellow(i) <= '0';
						red(i) <= '0';
					else
						green(i) <= '0';
						yellow(i) <= '1';
						red(i) <= '0';
					end if;
				else
					green(i) <= '0';
					yellow(i) <= '0';
					red(i) <= '1';
				end if;
			end loop;
			

		end if;
	end process;
	
end architecture;