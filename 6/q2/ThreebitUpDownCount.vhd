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

Signal Q,T,Qc:std_logic_vector(2 downto 0);
Signal v0,v1,v2,v3,v5,v6,v7,v8:std_logic;
Signal upc:std_logic;

-- declare components of basic_gates and flipflop
component and_gate
	port(a,b : in std_logic;
			c:out std_logic);
end component;

component and3_gate
	port(a,b,c : in std_logic;
			d:out std_logic);
end component;

component and4_gate
	port(a,b,c,d : in std_logic;
			e:out std_logic);
end component;

component or_gate
	port(a,b : in std_logic;
			c:out std_logic);
end component;

component or5_gate
	port(a,b,c,d,e : in std_logic;
			f:out std_logic);
end component;

component xor_gate
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

--From kmap T0 = Q0'
notgate4 : not_gate
port map(Q(0),Qc(0));

T(0) <= Qc(0);

--From Kmap T1 = up'.(Q0 xor Q1)' + up.(Q0 xor Q1)
xorgate0 : xor_gate
port map(Q(0),Q(1),v1);

notgate0 : not_gate
port map(up,upc);

notgate1 : not_gate
port map(v1,v2);

andgate0 : and_gate
port map(v1,up,v3);

andgate1 : and_gate
port map(v2,upc,v4);

orgate1 : or_gate
port map(v4,v3,T(1));

ff2 : DFlipFlop
port map(clk,rst,T(1),S(1));


-- From Kmap T2 = up'.S1.S0 + up.S1'.S0'
notgate2 : not_gate
port map(Q(1),Qc(1));
notgate2 : not_gate
port map(Q(2),Qc(2));

andgate2 : and3_gate
port map(Q(2),Q(1),Qc(0),v5);
andgate3 : and3_gate
port map(up,Q(2),Qc(1),v6);
andgate4 : and3_gate
port map(upc,Q(0),Q(2),v7);

andgate5 : and4_gate
port map(upc,Qc(0),Qc(1),Qc(2),v8);
andgate6 : and4_gate
port map(up,Q(0),Q(1),Qc(2),v9);

orgate2 : or5_gate
port map(v5,v6,v7,v8,v9,T(2));


--Now we will use flipflops to get the values for next iterations, each of T0,T1,T2 have been fed into the flipflops
ff1 : DFlipFlop
port map(clk,rst,T(2),Q(2));

ff2 : DFlipFlop
port map(clk,rst,T(1),Q(1));

ff3 : DFlipFlop
port map(clk,rst,T(0),Q(0));


--The output is simply the bits in S as defined by our states
count(2) <= Q(2);
count(1) <= Q(1);
count(0) <= Q(0);

end architecture;

