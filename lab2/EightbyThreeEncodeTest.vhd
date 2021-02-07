LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ENCODEtest IS
END ENCODEtest;

ARCHITECTURE behavior OF ENCODEtest IS 

-- Component Declaration for the Unit Under Test (UUT)

    COMPONENT EightbyThreeEncode IS
        PORT (
            i : IN STD_LOGIC_vector(7 downto 0);
				en : IN STD_LOGIC;
            z : OUT std_logic_vector(2 downto 0));
    END COMPONENT;


   --Inputs
   signal i : std_logic_vector(7 downto 0);
   signal en : std_logic;

   --Outputs
   signal z : std_logic_vector(2 downto 0);

BEGIN

-- Instantiate the Unit Under Test (UUT)
    dut_instance: EightbyThreeEncode PORT MAP (
           i(7 downto 0),
           en,
           z => z
           );

   -- Stimulus process
   stimulus: process
   begin
		i(0) <= '1';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;
		 
      en <= '1';
      wait for 10 ns;
		 
		i(0) <= '0';
		i(1) <= '1';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '0';
		
		en <= '0';
      wait for 10 ns;
      
		en <= '1';
      wait for 10 ns;
		
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '1';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '1';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '1';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '1';
		i(6) <= '0';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '1';
		i(7) <= '0';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		  
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		i(4) <= '0';
		i(5) <= '0';
		i(6) <= '0';
		i(7) <= '1';
		
		en <='0';
      wait for 10 ns;

		en <= '1';
      wait for 10 ns;
		 
   end process stimulus;
END architecture behavior;
