LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY test IS
END test;

ARCHITECTURE behavior OF test IS 

-- Component Declaration for the Unit Under Test (UUT)

    COMPONENT TwoByFourDecode IS
        port (  i : in std_logic_vector (1 downto 0); 
            en: in std_logic;
            z : out std_logic_vector (3 downto 0));
    END COMPONENT;


   --Inputs
   signal i : std_logic_vector(1 downto 0);
   signal en : std_logic;

   --Outputs
   signal z : std_logic_vector(3 downto 0);

BEGIN

-- Instantiate the Unit Under Test (UUT)
    dut_instance: TwoByFourDecode PORT MAP (
           i(1 downto 0),
           en,
           z => z
           );

   -- Stimulus process
   stimulus: process
   begin
		i(0) <= '0';
		i(1) <= '0';
		
		en <='0';
      wait for 10 ns;
		 
      en <= '1';
      wait for 10 ns;
		 
		i(0) <= '1';
		i(1) <= '0';
		
		en <= '0';
      wait for 10 ns;
      
		en <= '1';
      wait for 10 ns;
		
		i(0) <= '0';
		i(1) <= '1';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '1';
		i(1) <= '1';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		 
   end process stimulus;
END architecture behavior;
