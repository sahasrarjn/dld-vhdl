library IEEE;
use IEEE.std_logic_1164.all;

-- Entity of 3 by 8 Decoder
entity ThreebyEightDecode is
	port( i : in std_logic_vector(2 downto 0);
				en: in std_logic;
				z: out std_logic_vector(7 downto 0));
	end entity;
	
-- architecture of 3:8 Decoder
architecture threebyeight_behaviour  of ThreebyEightDecode is

Signal ni : std_logic_vector(2 downto 0); --Vector to store intermediate signals

-- declare components of basic_gates
component not_gate
	port(a: in std_logic;
		 c: out std_logic);
end component;

component fourAndGate
	port(a,b,c,d : in std_logic;
			e :out std_logic);
end component;


begin
not0 : not_gate
port map(i(0),ni(0)); -- A'

not1 : not_gate
port map(i(1),ni(1)); -- B' 

not2 : not_gate
port map(i(2),ni(2)); -- C'

and0 : fourAndGate
port map(ni(0),ni(1),ni(2),en,z(0)); -- A'B'C'

and1 : fourAndGate
port map(ni(0),ni(1),i(2),en,z(1)); -- A'B'C

and2 : fourAndGate
port map(ni(0),i(1),ni(2),en,z(2)); -- A'BC'

and3 : fourAndGate
port map(ni(0),i(1),i(2),en,z(3)); -- A'BC

and4 : fourAndGate
port map(i(0),ni(1),ni(2),en,z(4)); -- AB'C'

and5 : fourAndGate
port map(i(0),ni(1),i(2),en,z(5)); -- AB'C

and6 : fourAndGate
port map(i(0),i(1),ni(2),en,z(6)); -- ABC'

and7 : fourAndGate
port map(i(0),i(1),i(2),en,z(7)); -- ABC

end threebyeight_behaviour;

	
	
			