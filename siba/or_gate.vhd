entity or_gate is
port(A,B: in bit;
	C: out bit);
end or_gate;

architecture orStruct of or_gate is
begin
	C <= A or B;
end orStruct;