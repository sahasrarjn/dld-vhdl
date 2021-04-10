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
	variable cnt2 :natural range 0 to 5 := 0; --cnt2 is for duration of signals
	variable activelane : natural range 0 to 3 := 0; --current lane where red not there
	
	begin
		
		if(rising_edge(clk)) then
			if(rst = '1') then --if reset is set then we have to reset the signal  and counters to default
				cnt1 := 0;
				cnt2 := 0;
				activelane := 0;
			else
				for i in 0 to 3 loop
					if(i = activelane) then --update the signals on the activelane
						if(cnt1 = 0) then
							green(i) <= '1';
							yellow(i) <= '0'; --green updte
							red(i) <= '0';
						else
							green(i) <= '0';
							yellow(i) <= '1'; --yellow update
							red(i) <= '0'; 
						end if;
					else
						green(i) <= '0';
						yellow(i) <= '0'; --red update
						red(i) <= '1'; 
					end if;
				end loop;
				if(cnt1 = 0) then --it means now signal is green
					if(cnt2 < 5) then --increase upto 5 clock cycles
						cnt2 := cnt2+1; 
					else
						cnt2 := 0; --after 5 clockcycles cnt1 is made 1 which means signal is yellow now
						cnt1 := 1;
					end if;
				else	--current signal is yellow
					cnt2 := 0; -- after a clockcycle change active lane
					cnt1 := 0;
					if(activelane = 3) then -- change active lane after yellow is over
						activelane := 0;
					else 
						activelane := activelane + 1; 
					end if;
				end if;	
			end if;
		end if;
	end process;
	
end architecture;