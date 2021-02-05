library IEEE;
use IEEE.std_logic_1164.all;

entity EightbyThreeEncode is
	port( i : in std_logic_vector(7 downto 0):
				en: in std_logic;
				z: out std_logic_vector(2 downto 0));
	end entity;
	
-- architecture of 2x1 mux
architecture eightbythree_behaviour  of EightbyThreeEncode is

Signal d : std_logic_vector(2 downto 0); --Vector to store intermediate signals
--Signal n : std_logic; --Gate to do ~sel

-- declare components of basic_gates
component and_gate
	port(a,b : in std_logic;
			c:out std_logic);
end component;

component fourOrGate
	port(a,b,c,d : in std_logic;
			e :out std_logic);
end component;


begin
or1 : fourOrGate
port map(i(1),i(3),i(5),i(7), d(0));

or2 : fourOrGate
port map(i(2),i(3),i(6),i(7), d(1));

or3 : fourOrGate
port map(i(4),i(5),i(6),i(7), d(2));

and1 : and_gate
port map(d(0),en,z(0));

and2 : and_gate
port map(d(1),en,z(1));

and3 : and_gate
port map(d(2),en,z(2));

end eightbythree_behaviour;

	
	
			