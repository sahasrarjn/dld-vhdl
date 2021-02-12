--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity TwoByFourDecode is
    port (  i : in std_logic_vector (3 downto 0); 
            en: in std_logic;
            z : out std_logic_vector (1 downto 0));
end entity;

-- architecture of 2x1 mux
architecture structure  of TwoByFourDecode is 

Signal v1 : std_logic_vector(1 downto 0);
Signal v2 : std_logic_vector(1 downto 0);

-- declare components of TwoByOneMux
component two_one_mux
	port(   i : in std_logic_vector(1 downto 0);
            sel : in std_logic        
            z : out std_logic);
end component;

begin
    v1(0) <= i(1);
    v1(1) <= i(3);
    v1(0) <= i(2);
    v1(1) <= i(3);

    mux1 : two_one_mux
    port map(v1,v1(0),z(0));

    mux2 : two_one_mux
    port map(v2,v2(0),z(1));
end structure;

	
	
			