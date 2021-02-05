--Implemenation of 4x1 MUX
library IEEE;
use IEEE.std_logic_1164.all;

--declaration of entity
entity FourbyOneMux is 
	port(i : in std_logic_vector(3 downto 0); --4 input bits as a std_logic_vector
			sel : in std_logic_vector(1 downto 0); -- selector vector s1 and s0
			z : out std_logic); --output
end entity;

--declaration of architecture

architecture fourbyOneMux_behaviour of FourbyOneMux is

Signal inp: std_logic_vector(1 downto 0);

-- declaration of 2x1 MUX component
component TwobyOneMux is 
	port(i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic);
end component;

begin

mux1 : TwobyOneMux					      -- i(3).sel(0) + i(2).~sel(0)
port map(i(3 downto 2),sel(0),inp(1)); -- i(3) and i(2) are fed into 2x1 mux along with sel(0) as selection line and output stored in inp(1)

mux2 : TwobyOneMux							-- i(1)sel(0) + i(0).~sel(0)	
port map(i(1 downto 0),sel(0),inp(0)); -- i(1) and i(0) are fed into 2x1 mux along with sel(0) as selection line and output stored in inp(0)

mux3 : TwobyOneMux		--(i(3).sel(0) + i(2).~sel(0)).sel(1) + (i(1)sel(0) + i(0).~sel(0).~sel(1)) 
port map(inp,sel(1),z); -- == i(3).sel(0).sel(1) + i(2).~sel(0).sel(1) + i(1).sel(0).~sel(1) + i(0).~sel(0).~sel(1)
-- inp(1) and inp(0) are fed into 2x1 mux along with sel(0) as selection line and output in z

end FourbyOneMux_behaviour;

