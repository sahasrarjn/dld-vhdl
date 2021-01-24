entity lab1 is
	port(inA, inB : in bit;
	oAnd, oOr, oNot : out bit);
end lab1;

architecture lab of lab1 is
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