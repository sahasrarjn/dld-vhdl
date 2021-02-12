--Implementation of 2x1 MUX
library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity TwobyOneMux is 
	port(i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic); -- a single output
end entity;

-- architecture of 2x1 mux
architecture twobyOneMux_behaviour  of TwobyOneMux is 

Signal d : std_logic_vector(1 downto 0); --Vector to store intermediate signals
Signal n : std_logic; --Gate to do ~sel

-- declare components of basic_gates
component and_gate
	port(a,b : in std_logic;
			c:out std_logic);
end component;

component or_gate
	port(a,b : in std_logic;
			c:out std_logic);
end component;

component not_gate
	port(a : in std_logic;
			c:out std_logic);
end component;

begin
notgate : not_gate
port map(sel,n);  -- n = ~sel

andgate1 : and_gate 
port map(i(0),n,d(0)); -- d(0) = i(0)&(~sel)

andgate2 : and_gate
port map(i(1),sel,d(1)); -- d(1) = i(1)&sel

orgate : or_gate
port map(d(0),d(1),z); -- z = d(0) or d(1) /// equiv to z = i(0).~sel + i(1).sel

end twobyOneMux_behaviour;

	
	
			