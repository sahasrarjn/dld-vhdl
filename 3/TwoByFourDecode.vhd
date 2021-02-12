--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity TwoByFourDecode is
    port (  i : in std_logic_vector (1 downto 0); 
            en: in std_logic;
            z : out std_logic_vector (3 downto 0));
end entity;

-- architecture of 4x2 encoder
architecture structure  of TwoByFourDecode is 

    Signal neg : std_logic_vector(1 downto 0);
    Signal def : std_logic_vector(1 downto 0);
	 Signal v1 : std_logic_vector(1 downto 0);
	 Signal v2 : std_logic_vector(1 downto 0);
	 Signal v3 : std_logic_vector(1 downto 0);
	 Signal v4 : std_logic_vector(1 downto 0);
	 Signal v5 : std_logic_vector(1 downto 0);
	 Signal v6 : std_logic_vector(1 downto 0);
	 Signal v7 : std_logic_vector(1 downto 0);
	 Signal v8 : std_logic_vector(1 downto 0);    
	 Signal zt : std_logic_vector(3 downto 0);

    -- declare components
    component TwoByOneMux
        port(   i : in std_logic_vector(1 downto 0);
                sel : in std_logic;       
                z : out std_logic);
    end component;

    begin
		def(0) <= '1';
		def(1) <= '0';
		
      not1 : TwoByOneMux
      port map(def,i(0),neg(0));
		
      not2 : TwoByOneMux
      port map(def,i(1),neg(1));
      
      v1(0) <= neg(0);
		v1(1) <= neg(1);
      and0 : TwoByOneMux
		port map(v1,v1(0),zt(0));
		
		v2(0) <= i(0);
		v2(1) <= neg(1);
      and1 : TwoByOneMux
		port map(v2,v2(0),zt(1));
		
		v3(0) <= neg(0);
		v3(1) <= i(1);
      and2 : TwoByOneMux
		port map(v3,v3(0),zt(2));
		
		v4(0) <= i(0);
		v4(1) <= i(1);
      and3 : TwoByOneMux
		port map(v4,v4(0),zt(3));
		
		
		
		v5(0) <= en;
	   v5(1) <= zt(0);
		enable0 : TwoByOneMux
	   port map(v5,v5(0),z(0));

	   
		v6(0) <= en;
	   v6(1) <= zt(1);
		enable1 : TwoByOneMux
	   port map(v6,v6(0),z(1));

		
		v7(0) <= en;
	   v7(1) <= zt(2);
		enable2 : TwoByOneMux
	   port map(v7,v7(0),z(2));

		
		v8(0) <= en;
	   v8(1) <= zt(3);
		enable3 : TwoByOneMux
	   port map(v8,v8(0),z(3));

end structure;

    
    
            