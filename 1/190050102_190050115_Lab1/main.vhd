--entity for combining all the gates
entity main is
	port(A, B : in bit; --defined input bits
		oAnd, oOr, oNot : out bit); --defined output bits
end main;

--architecture of main entity
architecture ar of main is
	component andGate is
		port(a,b: in bit;
			c: out bit);   --imported the and gate
	end component;

	component orGate is      
		port(a,b: in bit;
			c: out bit);   --imported the or gate
	end component;

	component notGate is
		port(a: in bit;
			c: out bit);  --imported the not gate
	end component;

begin
	gateAnd : andGate
		port map(A,B,oAnd); --and gate instance created

	gateOr : orGate
		port map(A,B,oOr);  --or gate instance created

	gateNot : notGate
		port map(A,oNot);  --not gate instance created

end ar;