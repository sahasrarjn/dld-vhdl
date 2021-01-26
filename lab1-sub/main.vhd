-- Entity for main (a black box with two inputs and three outputs corresponding to AND, OR, NOT)
entity main is
	port(A, B : in bit;
		oAnd, oOr, oNot : out bit);
end main;

-- Architecture of the main entity
architecture ar of main is
	-- Component of gates
	component andGate is
		port(a,b: in bit;
			c: out bit);
	end component;

	component orGate is
		port(a,b: in bit;
			c: out bit);
	end component;

	component notGate is
		port(a: in bit;
			c: out bit);
	end component;

begin
	gateAnd : andGate
		port map(A,B,oAnd);

	gateOr : orGate
		port map(A,B,oOr);

	gateNot : notGate
		port map(A,oNot);

end ar;