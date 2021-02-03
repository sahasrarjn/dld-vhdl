-- Entity for OR gate
entity orGate is 
	port(A, B : in bit; C : out bit);
end entity orGate;


-- Architecture or OR gate
architecture struct of orGate is
begin
	-- And of A or B
	C <= (A or B);
end struct;
