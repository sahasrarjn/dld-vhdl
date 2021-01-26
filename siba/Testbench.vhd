entity Testbench is 
end Testbench;

architecture tb of Testbench is
	signal X,Y:bit; --input
	signal and_op,or_op,not_X:bit; --output
	
	component Lab1 is
		port(inp_a,inp_b : in bit;
		op_and, op_or, op_not: out bit);
	end component;

begin
	dut_instance : Lab1
		port map (X,Y,and_op,or_op,not_X);
	
	process
	begin
		X <= '0';
		Y <= '0';
		wait for 1 ns;
		X <= '0';
		Y <= '1';
		wait for 1 ns;
		X <= '1';
		Y <= '0';
		wait for 1 ns;
		X <= '1';
		Y <= '1';
		wait for 1 ns;
	end process;
end tb;
		
	
	