-- Entity for NOT gate
entity notGate is 
	port(A : in bit; C : out bit);
end entity notGate;


-- Architecture or NOT gate
architecture struct of notGate is
begin
	-- And of A or B
	C <= not A;
end struct;
