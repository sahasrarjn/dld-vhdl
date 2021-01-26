entity and_gate is
port(A,B :in bit;
	C: out bit);
end and_gate;

architecture andStruct of and_gate is
begin
	C <= A and B;
end andStruct;