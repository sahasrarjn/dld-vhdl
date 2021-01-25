entity Testbench is
end Testbench;

architecture tb of Testbench is
	signal x, y : bit; -- Inputs (simulation)
	signal c : bit; -- Outputs (simulation)

	component orGate is
	port(A, B : in bit;
			C : out bit);
	end component;
	
	begin
		-- Connecting testbench signals with the andgate.vhd
		dut_instance: orGate
		port map(A=>x, B=>y, C=>c);
		
		process -- inputs
		begin
		x <='0';
		y <='0';
		wait for 5 ns;
		
		x <='0';
		y <='1';
		wait for 5 ns;
		
		x <='1';
		y <='0';
		wait for 5 ns;
		
		x <='1';
		y <='1';
		wait for 5 ns;
		
	end process;
end tb;