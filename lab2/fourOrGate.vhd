library IEEE;
use IEEE.std_logic_1164.all;

-- OR gate
entity fourOrGate is
port(a,b,c,d : in std_logic;
	  e: out std_logic);
end entity;

-- architure of NOT gate
architecture not_behaviour of not_gate is
begin
	e <= ((a or b) or (c or d));
end not_behaviour;



