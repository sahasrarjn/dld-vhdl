--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;


entity Generator is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           G_out : out STD_LOGIC;
           P_out : out STD_LOGIC);
end Generator;

-- architecture of 8-bit Kogge Stone Adder-Subtractor
architecture structure of carry is 

    Signal Bc : std_logic;
    Signal def : std_logic_vector(1 downto 0);


    -- declared component 2x1 MUX
    component TwoByOneMux
        port(   a : in std_logic;
                b: in std_logic;
                sel : in std_logic;
                z : out std_logic); -- a single output
    end component;

    begin

    def(0) <= '1';
    def(1) <= '0';

    -- Bc = B'
    not1 : TwoByOneMux
    port map(def(0), def(1), B, Bc);

    -- G_out = A AND B
    and1 : TwoByOneMux
    port map(A,B,A,G_out);

    -- P_out = A XOR B
    xor1 : TwoByOneMux
    port map(B,Bc,A,P_out);

end structure;

	
	
			