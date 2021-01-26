entity Lab1 is
	port(inp_a,inp_b : in bit;
	op_and, op_or, op_not: out bit);
end Lab1;

architecture lab of Lab1 is
	
	component and_gate is
		port(a,b:in bit;
		c: out bit);
	end component;
	
	component or_gate is
		port(a,b:in bit;
		c:out bit);
	end component;
	
	component not_gate is
		port(a :in bit;
		o: out bit);
	end component;

begin 

	gate_and : and_gate
		port map(inp_a,inp_b,op_and);
	
	gate_or : or_gate
		port map(inp_a,inp_b,op_or);

	gate_not : not_gate
		port map(inp_a, op_not);
	
	
end lab;