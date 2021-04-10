library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture tb of testbench is
	component TrafficLightController
		port ( clk, rst : in std_logic;
		green, yellow, red: out std_logic_vector(3 downto 0));
	end component;
	signal clk : std_logic; --clock signal
	signal rst : std_logic; -- reset signal
	signal green,yellow,red : std_logic_vector(3 downto 0); --traffic lights
	
begin
	dut_instance:TrafficLightController
	 port map (clk => clk, rst => rst, green => green, yellow => yellow, red => red);
	
	process 
	begin
	
	rst <= '0'; --run a simulation
	for i in 0 to 100 loop
		clk <='1';
		wait for 2.5 sec;
		clk <= '0';
		wait for 2.5 sec;
	end loop;
	
	rst <= '1'; --reset
	
	clk <='1';
	wait for 2.5 sec;
	clk <= '0';
	wait for 2.5 sec;
	
	rst <= '0';
	
	for i in 0 to 100 loop --continue simulation after reset
		clk <='1';
		wait for 2.5 sec;
		clk <= '0';
		wait for 2.5 sec;
	end loop;
	
	wait;
	end process;
	
end architecture;