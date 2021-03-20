
library IEEE;
use IEEE.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture tb of TestBench is
    signal c,r,u :  std_logic;
	 signal cnt:  std_logic_vector(2 downto 0);
 
	component ThreebitUpDownCount 
		port ( clk, rst, up : in std_logic;
				count : out std_logic_vector (2 downto 0));
	end component;

begin
    
	dut_instance: ThreebitUpDownCount
	port map (clk=>c, rst=>r, up=>u, count=>cnt);

	clock_process :process
	begin
		  c <= '0';
		  wait for 10 ns;
		  c <= '1';
		  wait for 10 ns;
	end process;


	-- Stimulus process
	stim_proc: process
	begin        
		-- hold reset state for 100 ns.
		  r <= '1';
		u <= '0';
		 wait for 20 ns;    
		 r <= '0';
	  wait for 300 ns;    
	  u <= '1';
		wait;
end process;
end tb;
