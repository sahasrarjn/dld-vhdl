library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

-- AND gate
entity and_gate is
port(a,b : in std_logic;
	  c:out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- OR gate
entity or_gate is
port(a,b : in std_logic;
	  c:out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- NOT gate
entity not_gate is
port(a : in std_logic;
	  c:out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- Four OR gate (OR operator on 4 signals)
entity fourOrGate is
port(a,b,c,d : in std_logic;
	  e: out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- Four AND gate (AND operator on 4 signals)
entity fourAndGate is
port(a,b,c,d : in std_logic;
	  e: out std_logic);
end entity;



-- architecture of AND gate
architecture and_behaviour of and_gate is
begin
	c <= a and b;
end and_behaviour;

-- architecture of OR gate
architecture or_behaviour of or_gate is
begin
	c <= a or b;
end or_behaviour;

-- architure of NOT gate
architecture not_behaviour of not_gate is
begin
	c <= not a;
end not_behaviour;

-- architecture of fouOrGate
architecture fourOr_behaviour of fourOrGate is
begin
	e <= ((a or b) or (c or d));
end fourOr_behaviour;

-- architecture of fourAndGate
architecture fourAnd_behaviour of fourAndGate is
begin
	e <= ((a and b) and (c and d));
end fourAnd_behaviour;
