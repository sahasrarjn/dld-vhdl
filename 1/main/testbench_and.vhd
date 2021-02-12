entity testbench_and is
end testbench_and;

architecture tb of testbench_and is
	signal x,y:bit; -- Inputs (simulation)
	signal outBit:bit; -- Outputs (simulation)

	component andGate is
	port(A,B : in bit;
		C : out bit);
	end component;
	
	begin
		-- Connecting testbench signals with the andgate.vhd
		dut_instance : andGate
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
