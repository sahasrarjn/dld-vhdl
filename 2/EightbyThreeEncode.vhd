library IEEE;
use IEEE.std_logic_1164.all;

-- Entity for 8 by 3 Encoder
entity EightbyThreeEncode is
	port( i : in std_logic_vector(7 downto 0);
				en: in std_logic;
				z: out std_logic_vector(2 downto 0));
	end entity;
	
-- architecture of 8 by 3 Encoder
architecture eightbythree_behaviour  of EightbyThreeEncode is

	Signal d : std_logic_vector(2 downto 0); --Vector to store intermediate signals

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
		port map(i(1),i(3),i(5),i(7), d(0)); -- D0 = I1 + I3 + I5 + I7

		or2 : fourOrGate
		port map(i(2),i(3),i(6),i(7), d(1)); -- D1 = I2 + I3 + I6 + I7 

		or3 : fourOrGate
		port map(i(4),i(5),i(6),i(7), d(2)); -- D2 = I4 + I5 + I6 + I7

		and1 : and_gate
		port map(d(0),en,z(0));	-- AND gate to check enable signal

		and2 : and_gate
		port map(d(1),en,z(1)); -- AND gate to check enable signal

		and3 : and_gate
		port map(d(2),en,z(2)); -- AND gate to check enable signal

end eightbythree_behaviour;

