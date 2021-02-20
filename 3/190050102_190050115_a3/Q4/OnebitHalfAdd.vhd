-- Implementation of One bit half adder
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

entity OnebitHalfAdd is --defining input and output as per the question
	port( a,b : in std_logic;
		sum,carry : out std_logic);
end entity;

architecture OnebitHalfAdd_behaviour of ONebitHalfAdd is

Signal v1 : std_logic_vector(1 downto 0);
Signal v2 : std_logic_vector(1 downto 0);
Signal v3 : std_logic_vector(1 downto 0);
Signal res: std_logic;
Signal inp:std_logic_vector(1 downto 0);

component TwoByOneMux --impprting component 2*1 MUX already there in work library
		port(i : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			z : out std_logic);
end component;

begin

-- First we draw ROBDD's for each bit and from it, we can obtain the circuit with corresponding MUXes 
--caculating the carry bit from ROBDD
v1(0) <= '0';   
v1(1) <= '1';

carry_mux1 : TwoByOneMux 
port map(v1,b,v2(1));   --First mux for carry

v2(0) <= '0';

carry_mux2 : TwoByOneMux
port map(v2,a,carry);  --Second mux for carry

--calculating sum bit from ROBDD
sum_mux1 : TwoByOneMux
port map(v1,b,inp(0)); --First mux for sum

v3(0) <= '1';
v3(1) <= '0';

sum_mux2 : TwoByOneMux
port map(v3,b,inp(1)); --Second mux for sum

sum_mux3 : TwoByOneMux
port map(inp,a,sum); --Third mux for sum

end OnebitHalfAdd_behaviour;