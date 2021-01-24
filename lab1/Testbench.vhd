entity main is
end main;

architecture tb of main is
	signal x, y : bit; --inputs
	signal andGate, orGate, notGate : bit; --outputs
	
	component main is
		port(A, B: in bit;
			C, D, E: out bit);
	end component;
	
begin
	-- Connecting test bench signals with HalfAdder.vhd
	dut_instance: main
	port map (A=>x, B=>y, C=>andGate, D=>orGate, E=>notGate);
	process --inputs
	begin
	x <= '0';
	y <= '0';
	wait for 5 ns;
	
	x <= '0';
	y <= '1';
	wait for 5 ns;

	x <= '1';
	y <= '0';
	wait for 5 ns;

	x <= '1';
	y <= '1';
	wait for 5 ns;

	end process;
	end tb;