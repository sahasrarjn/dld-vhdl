entity testbench_or is
end testbench_or;

architecture tb of testbench_or is
	signal x,y:bit; -- Inputs (simulation)
	signal outBit:bit; -- Outputs (simulation)

	component orGate is
	port(A,B : in bit;
		C : out bit);
	end component;
	
	begin
		-- Connecting testbench_or signals with the andgate.vhd
		dut_instance : orGate
			port map(x, y, outBit);

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
