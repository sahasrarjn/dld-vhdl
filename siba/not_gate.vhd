entity not_gate is
port(A: in bit;
	O: out bit);
end not_gate;

architecture notStruct of not_gate is
begin
	O <= not a;
end notStruct;
