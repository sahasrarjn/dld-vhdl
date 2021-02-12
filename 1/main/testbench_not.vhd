entity testbench_not is
end testbench_not;

architecture tb of testbench_not is
	signal x:bit; -- Inputs (simulation)
	signal outBit:bit; -- Outputs (simulation)

	component notGate is
	port(A : in bit;
		C : out bit);
	end component;
	
	begin
		-- Connecting testbench_not signals with the andgate.vhd
		dut_instance : notGate
			port map(x, outBit);

		process -- inputs
		begin
		x <='0';
		wait for 5 ns;
		x <='1';
		wait for 5 ns;		
	end process;
end tb;
