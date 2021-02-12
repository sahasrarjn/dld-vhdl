LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUXtest IS
END MUXtest;

ARCHITECTURE behavior OF MUXtest IS 

-- Component Declaration for the Unit Under Test (UUT)

    COMPONENT FourByOneMux IS
        PORT (
            i : IN STD_LOGIC_vector(3 downto 0);
				sel : IN STD_LOGIC_vector(1 downto 0);
            z : OUT STD_LOGIC);
    END COMPONENT;


   --Inputs
   signal i : std_logic_vector(3 downto 0);
   signal sel : std_logic_vector(1 downto 0);

   --Outputs
   signal z : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)
    dut_instance: FourByOneMux PORT MAP (
           i(3 downto 0),
           sel(1 downto 0),
           z => z
           );

   -- Stimulus process
   stimulus: process
   begin
		i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		 
		 
		 i(0) <= '1';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		 
		  
		 i(0) <= '0';
		i(1) <= '1';
		i(2) <= '0';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '0';
		i(1) <= '0';
		i(2) <= '1';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '0';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '1';
		i(1) <= '1';
		i(2) <= '0';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '1';
		i(1) <= '0';
		i(2) <= '1';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '1';
		i(1) <= '0';
		i(2) <= '0';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '0';
		i(1) <= '1';
		i(2) <= '1';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '0';
		i(1) <= '1';
		i(2) <= '0';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		  
		 i(0) <= '0';
		i(1) <= '0';
		i(2) <= '1';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
		
		 
		 i(0) <= '0';
		i(1) <= '1';
		i(2) <= '1';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		 
		 
		  
		 i(0) <= '1';
		i(1) <= '0';
		i(2) <= '1';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		 
		  
		 i(0) <= '1';
		i(1) <= '1';
		i(2) <= '0';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
       wait for 10 ns;
		 
		 
		  
		 i(0) <= '1';
		i(1) <= '1';
		i(2) <= '1';
		i(3) <= '0';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
		 
		  
		 i(0) <= '1';
		i(1) <= '1';
		i(2) <= '1';
		i(3) <= '1';
		
		sel(0)<='0';
		sel(1) <= '0';
		
       wait for 10 ns;
       sel(0)<='0';
		sel(1) <= '1';
       wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '0';
		 wait for 10 ns;
       sel(0)<='1';
		sel(1) <= '1';
       wait for 10 ns;
   end process stimulus;
END architecture behavior;
