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

    Signal v1 : std_logic_vector(1 downto 0);
    Signal v2 : std_logic_vector(1 downto 0);
	 Signal v3 : std_logic_vector(1 downto 0);
    Signal v4 : std_logic_vector(1 downto 0);
	 Signal zt : std_logic_vector(1 downto 0);

    -- declare components
    component TwoByOneMux
        port(   i : in std_logic_vector(1 downto 0);
                sel : in std_logic;       
                z : out std_logic);
    end component;

    begin
	  v1(0) <= i(1);
	  v1(1) <= i(3);
	  v2(0) <= i(2);
	  v2(1) <= i(3);
	  
	  mux1 : TwoByOneMux
	  port map(v1,v1(1),zt(0));

	  mux2 : TwoByOneMux
	  port map(v2,v2(1),zt(1));
	  
	  v3(0) <= en;
	  v3(1) <= zt(0);
	  v4(0) <= en;
	  v4(1) <= zt(1);
	  
	  
	  muxEn1 : TwoByOneMux
	  port map(v3,en,z(0));
	  
	  muxEn2 : TwoByOneMux
	  port map(v4,en,z(1));
	  
end structure;

	
	
			