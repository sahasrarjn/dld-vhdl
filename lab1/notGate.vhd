entity notGate is 
port(A :in bit;
	C: out bit);
end notGate;

architecture notStruct of notGate is
begin 
	C <= not A;
end notStruct;