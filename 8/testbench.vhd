library ieee;
use ieee.std_logic_1164.all;

entity testbench is
end entity;

architecture tb of testbench is
	component TrafficLightController
		port ( clk, rst : in std_logic;
		green, yellow, red: out std_logic_vector(3 downto 0));
	end component;
	signal clk : std_logic;
	signal rst : std_logic;
	signal green,yellow,red : std_logic_vector(3 downto 0);
	
begin
	dut_instance:TrafficLightController
	 port map (clk => clk, rst => rst, green => green, yellow => yellow, red => red);
	
	process 
	begin
	
	rst = '0';
	for i in 0 to 180 loop
		clk <='1';
		wait for 2.5s;
		clk <= '0';
		wait for 2.5s;
	end loop;
	
	for i in 0 to 60 loop
		clk <='1';
		wait for 2.5s;
		clk <= '0';
		wait for 2.5s;
	end loop;
	
	rst = '1';
	clk<='1';
	wait for 2.5s;
	clk <= '0';
	wait for 2.5s;
	rst = '0';
	
	for i in 0 to 60 loop
		clk <='1';
		wait for 2.5s;
		clk <= '0';
		wait for 2.5s;
	end loop;
	
	wait;
	end process;
	
end architecture;