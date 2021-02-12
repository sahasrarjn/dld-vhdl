--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity FourByTwoEncode is
    port (  i : in std_logic_vector (3 downto 0); 
            en: in std_logic;
            z : out std_logic_vector (1 downto 0));
end entity;

-- architecture of 4x2 encoder
architecture structure  of FourByTwoEncode is 

    Signal v1 : std_logic_vector(1 downto 0) := ( 0 => i(1), 1 => i(3) );
    Signal v2 : std_logic_vector(1 downto 0) := ( 0 => i(2), 1 => i(3) );

    -- declare components
    component two_one_mux
        port(   i : in std_logic_vector(1 downto 0);
                sel : in std_logic        
                z : out std_logic);
    end component;

    begin
        mux1 : two_one_mux
        port map(v1,en,z(0));

        mux2 : two_one_mux
        port map(v2,en,z(1));
end structure;

	
	
			