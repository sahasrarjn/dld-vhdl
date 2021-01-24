entity main is
	port(inA, inB : in bit;
	oAnd, oOr, oNot : out bit);
end main;

architecture lab of main is
	component andGate is 
		port(a,b :in bit;
		c: out bit);
	end component;
	
	component orGate is 
		port(a,b :in bit;
		c: out bit);
	end component;
	
	component notGate is 
		port(a :in bit;
		c: out bit);
	end component;
	
	begin 
		gateAnd : andGate
			port map(inA,inB,oAnd);
			
		gateOr : orGate
			port map(inA,inB,oOr);
			
		gateNot : notGate
			port map(inA,oNot);
			
	end lab;