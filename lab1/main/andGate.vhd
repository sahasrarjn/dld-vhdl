-- Entity for AND gate
entity andGate is 
	port(A, B : in bit; C : out bit);
end entity andGate;


-- Architecture or AND gate
architecture struct of andGate is
begin
	-- And of A and B
	C <= (A and B);
end struct;