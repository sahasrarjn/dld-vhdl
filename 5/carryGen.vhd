--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity carryGen is
port ( 	ga : in std_logic; 
		pa : in std_logic;
		gb : in std_logic; 
		pb : in std_logic;
		g : out std_logic;
		p : out std_logic);
end entity;

-- architecture of 8-bit Kogge Stone Adder-Subtractor
architecture structure of carryGen is 


    -- Will use this signals to store temp signals formed
    Signal x1 : std_logic;
    


    -- declared component 2x1 MUX
    component TwoByOneMux
        port(	a : in std_logic;
				b: in std_logic;
				sel : in std_logic;
				z : out std_logic); -- a single output
    end component;

    begin

    -- p = pa AND pb
    and1 : TwoByOneMux
    port map(pa, pb, pa, p);
    
    -- x = pa AND gb
    and2 : TwoByOneMux
    port map(pa, gb, pa, x1);
    -- g = ga + x = ga + pa.gb
    or1 : TwoByOneMux
    port map(x1, ga, ga, g);


-- ------------------------------------------------------------
	  
end structure;

	
	
			