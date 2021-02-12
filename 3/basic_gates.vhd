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
