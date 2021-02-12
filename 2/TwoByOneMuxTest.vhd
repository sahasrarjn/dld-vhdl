LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY MUXtest IS
END MUXtest;

ARCHITECTURE behavior OF MUXtest IS 

-- Component Declaration for the Unit Under Test (UUT)

    COMPONENT TwoByOneMux IS
        PORT (
            i : IN STD_LOGIC_vector(1 downto 0);
				sel : IN std_logic;
            z : OUT STD_LOGIC);
    END COMPONENT;


   --Inputs
   signal i : std_logic_vector(1 downto 0);
   signal sel : std_logic := '0';

   --Outputs
   signal z : std_logic;

BEGIN

-- Instantiate the Unit Under Test (UUT)
    dut_instance: TwoByOneMux PORT MAP (
           i(1 downto 0),
           sel => sel,
           z => z
           );

   -- Stimulus process
   stimulus: process
   begin
		sel <= '0';
		i(0) <= '0';
		i(1) <= '0';
       wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
       sel <= '0';
		i(0) <= '1';
		i(1) <= '0';
       wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
		 sel <= '0';
		i(0) <= '0';
		i(1) <= '1';
       wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
		 sel <= '0';
		i(0) <= '1';
		i(1) <= '1';
       wait for 10 ns;
       sel <= '1';
       wait for 10 ns;
   end process stimulus;
END architecture behavior;
