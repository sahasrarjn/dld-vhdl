-- Implementation of One bit Full adder
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

entity OnebitFullAdd is --defining entity as per the question
	port(a,b,cin : in std_logic;
	sum,carry : out std_logic);
end entity;

architecture OnebitFullAdd_behaviour of OnebitFullAdd is

Signal v1 :std_logic_vector(1 downto 0);
Signal v2 :std_logic_vector(1 downto 0);
Signal s_0,c_0,c1: std_logic;

component OnebitHalfAdd
		port( a,b : in std_logic;
		sum,carry : out std_logic);
end component;

component TwoByOneMux
		port(i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic);
end component;
--we will first add the first 2 bits and then to the resulting sum, we will add the sum and carry bit, and then
--the carried bit will be added with the former carry bit obtained from first 2 bit's 
begin
Halfadder1 : OnebitHalfAdd
port map(a,b,s_0,c_0); --adding first 2 bits lets the sum be s_0 and carry be c_0

Halfadder2 : OnebitHalfAdd
port map(s_0,cin,sum,c1); --adding s_0 and cin and the resulting sum bit is the final sum bit, the carry will carry forward

-- the carries obtained from the above two halfadder should be added and their sum bit would be the final carry bit
-- The sum bit can also be calculated by A OR B coz both c1 and c_0 cannot be 1, since a+b<=2
v1(0) <= '0';
v1(1) <= '1';

mux1 : TwoByOneMux
port map(v1,c_0,v2(0)); --or implemented with 2 MUX

v2(1) <= '1';

mux2 : TwoByOneMux
port map(v2,c1,carry);

end OnebitFullAdd_behaviour;
