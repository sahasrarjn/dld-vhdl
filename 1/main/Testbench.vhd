entity Testbench is
end Testbench;

architecture tb of Testbench is
	signal x,y:bit; -- Inputs (simulation)
	signal and_out,or_out,not_out:bit; -- Outputs (simulation)

	component main is
	port(A,B : in bit;
		oAnd,oOr,oNot : out bit);
	end component;
	
	begin
		-- Connecting testbench signals with the andgate.vhd
		dut_instance : main
			port map(x, y, and_out, or_out, not_out);

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
