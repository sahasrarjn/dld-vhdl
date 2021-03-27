-- 2 basic gates AND, OR and NOT entities have been declared here
library IEEE;
use IEEE.std_logic_1164.all;

-- AND gate
entity and_gate is
port(a,b : in std_logic;
	  c:out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- AND gate
entity and3_gate is
port(a,b,c : in std_logic;
	  d:out std_logic);
end entity;

library IEEE;
use IEEE.std_logic_1164.all;

-- AND gate
entity and4_gate is
port(a,b,c,d : in std_logic;
	  e:out std_logic);
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

-- 5-OR gate
entity or5_gate is
port(a,b,c,d,e : in std_logic;
	  f:out std_logic);
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

-- XOR gate
entity xor_gate is
port(a , b: in std_logic;
	  c:out std_logic);
end entity;

-- architecture of AND gate
architecture and_behaviour of and_gate is
begin
	c <= a and b;
end and_behaviour;

-- architecture of 3-AND gate
architecture and_behaviour of and3_gate is
begin
	d <= (a and b) and c;
end and_behaviour;

-- architecture of 4-AND gate
architecture and_behaviour of and4_gate is
begin
	e <= (a and b) and (c and d);
end and_behaviour;

-- architecture of OR gate
architecture or_behaviour of or_gate is
begin
	c <= a or b;
end or_behaviour;

-- architecture of 5-OR gate
architecture or_behaviour of or5_gate is
begin
	f <= ((a or b) or (c or d)) or e;
end or_behaviour;

-- architure of NOT gate
architecture not_behaviour of not_gate is
begin
	c <= not a;
end not_behaviour;

-- architure of XOR gate
architecture xor_behaviour of xor_gate is
begin
	c <= b xor a;
end xor_behaviour;