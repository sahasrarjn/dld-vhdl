library ieee;
use ieee.std_logic_1164.all;

--Implementation of counter 0->1->2->3->2->1->0
--We will take 6 states, that are 000 -> 001 -> 010 -> 011 -> 110 -> 101 -> 000 
-- And the outputs for each transition is the last two bits of the state that is transitioned into

entity TwobitUpCount is
	port ( clk, rst : in std_logic;
	count: out std_logic_vector (1 downto 0));
end entity;

architecture behave of TwobitUpCount is

Signal Q:std_logic_vector(2 downto 0);
Signal tmp1,tmp2,tmp3,tmp4,tmp5,tmp6:std_logic;

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

component DFlipFlop
	port (clk, rst, d: in std_logic; q: out std_logic);
end component;

begin
-- From Kmap D2 = Q1.(Q0+Q2)
orgate1: or_gate
port map(Q(0),Q(2),tmp5);

andgate1: and_gate
port map(Q(1),tmp5,tmp6);

--From Kmap D1 = Q2'.(Q0+Q1)
notgate1 : not_gate
port map(Q(2),tmp1);

orgate2 : or_gate
port map(Q(1),Q(0),tmp3);

andgate2 : and_gate
port map(tmp1,tmp3,tmp2);

--From kmap D0 = Q0'
notgate2 : not_gate
port map(Q(0),tmp4);

--Now we will use flipflops to get the values for next iterations, each of D1,D0,D2 have been fed into the flipflops
ff1 : DFlipFlop
port map(clk,rst,tmp6,Q(2));

ff2 : DFlipFlop
port map(clk,rst,tmp2,Q(1));

ff3 : DFlipFlop
port map(clk,rst,tmp4,Q(0));

--The output is simply the last two bits as defined by our states
count(1) <= Q(1);
count(0) <= Q(0);

end architecture;

