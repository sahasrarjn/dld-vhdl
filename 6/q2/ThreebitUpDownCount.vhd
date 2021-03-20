library ieee;
use ieee.std_logic_1164.all;

--Implementation of counter 0->1->2->3->4->5->6->7->0...
--We will take 8 states, that are 000 -> 001 -> 010 -> 011 -> 100 -> 101 -> 110 -> 111 -> 000
-- And the outputs for each transition are the all three bits of the state that is transitioned into

entity ThreebitUpDownCount is
	port ( clk, rst, up : in std_logic;
	count : out std_logic_vector (2 downto 0));
end entity;

architecture structure of ThreebitUpDownCount is

Signal S,T:std_logic_vector(2 downto 0);
Signal v0,v1,v2,v3,S0c,S1c:std_logic;
Signal upc:std_logic;

-- declare components of basic_gates and flipflop
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

component and3_gate is
	port(a,b,c: in std_logic;
		  	d:	out std_logic);
end component;

component DFlipFlop
	port (clk, rst, d: in std_logic; q: out std_logic);
end component;

begin
notgate0 : not_gate
port map(up,upc);
notgate1 : not_gate
port map(S(0),S0c);
notgate2 : not_gate
port map(S(1),S1c);


-- From Kmap T2 = up'.S1.S0 + up.S1'.S0'
and3gate0 : and3_gate
port map(upc,S(1),S(0),v0);

and3gate1 : and3_gate
port map(up,S1c,S0c,v1);

orgate0 : or_gate
port map(v0, v1, T(2));



--From Kmap T1 = up'.S0 + up.S1
andgate0 : and_gate
port map(upc,S(0),v2);

andgate1 : and_gate
port map(up,S(1),v3);

orgate1 : or_gate
port map(v2,v3,T(1));



--From kmap T0 = 1
T(0) <= '1';



--Now we will use flipflops to get the values for next iterations, each of T0,T1,T2 have been fed into the flipflops
ff1 : DFlipFlop
port map(clk,rst,T(2),S(2));

ff2 : DFlipFlop
port map(clk,rst,T(1),S(1));

ff3 : DFlipFlop
port map(clk,rst,T(0),S(0));

--The output is simply the bits in S as defined by our states
count(2) <= S(2);
count(1) <= S(1);
count(0) <= S(0);

end architecture;

