entity andGate is 
port(A, B :in bit;
	C: out bit);
end andGate;

architecture andStruct of andGate is
begin 
	C <= A and B;
end andStruct;