entity orGate is 
port(A, B :in bit;
	C: out bit);
end orGate;

architecture orStruct of orGate is
begin 
	C <= A or B;
end orStruct;