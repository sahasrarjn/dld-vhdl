--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity FourbitComp is
port ( a, b : in std_logic_vector (1 downto 0); 
	l, g, e : out std_logic);
end entity;

-- architecture of 4x2 encoder
architecture structure  of FourbitComp is 
	-- l = A1' B1' + A0' B0 (A1 XNOR B1)
	-- e = (A1 XNOR B1) (A0 XNOR B0)
	-- g = A1 B1' + A0 B0' (A1 XNOR B1)


    -- Will use these signals to store temp signals formed
    Signal xnorAB : std_logic_vector(1 downto 0);
    Signal ac : std_logic_vector(1 downto 0);
    Signal bc : std_logic_vector(1 downto 0);
    Signal v0 : std_logic_vector(1 downto 0);
    Signal v1 : std_logic_vector(1 downto 0);
    Signal v2 : std_logic_vector(1 downto 0);
	Signal v3 : std_logic_vector(1 downto 0);
    Signal v4 : std_logic_vector(1 downto 0);
    Signal v5 : std_logic_vector(1 downto 0);
    Signal v6 : std_logic_vector(1 downto 0);
    Signal v7 : std_logic_vector(1 downto 0);
    Signal v8 : std_logic_vector(1 downto 0);
    Signal v9 : std_logic_vector(1 downto 0);
	Signal Acomp_B : std_logic_vector(1 downto 0);
	Signal A_Bcomp : std_logic_vector(1 downto 0);
	Signal x1 : std_logic;
	Signal x2 : std_logic;


    -- declared component 2x1 MUX
    component TwoByOneMux
        port(   i : in std_logic_vector(1 downto 0);
                sel : in std_logic;       
                z : out std_logic);
    end component;

    begin

-- ------------------------------------------------
-- Not gates
    -- 1 0 vector
		def(0) <= '1';
		def(1) <= '0';
		
	-- Implemented NOT gate using 2x1 MUX (A as sel pin and 0-1 vec to get A)
      	mux_not1 : TwoByOneMux
      	port map(def,a(0),ac(0));
      	mux_not2 : TwoByOneMux
      	port map(def,a(1),ac(1));
      	mux_not3 : TwoByOneMux
      	port map(def,b(0),bc(0));
      	mux_not4 : TwoByOneMux
      	port map(def,b(1),bc(1));
-- -------------------------------------------------


	  v0(0) <= ac(0);
	  v0(1) <= a(0);

	  v1(0) <= ac(1);
	  v1(1) <= a(1);

-- -------------------------------------
 -- Evaluating A XNOR B std_logic_vector
	  mux_xnor0 : TwoByOneMux
	  port map(v0,b(0),xnorAB(0));

	  mux_xnor1 : TwoByOneMux
	  port map(v1,b(1),xnorAB(1));
-- --------------------------------------
	  
	  
	  
-- Evaluating l (less than) -----------------------------------
	-- l = A1'B1 + A0'B0 (A1 XNOR B1)
	  v2(0) <= ac(1);
	  v2(1) <= b(1);
	  v3(0) <= ac(0);
	  v3(1) <= b(0);

	  mux_and0 : TwoByOneMux
	  port map(v2, v2(0), Acomp_B(1)); -- A1'B1
	  mux_and1 : TwoByOneMux
	  port map(v3, v3(0), Acomp_B(0)); -- A0'B0
	  
	  v4(0) <= Acomp_B(0);
	  v4(1) <= xnorAB(1);

	  mux_and2 : TwoByOneMux
	  port map(v4, v4(0), x1); -- A0'B0 (A1 XNOR B1)

	  v5(0) <= x1;
	  v5(1) <= Acomp_B(1);

	  mux_or0 : TwoByOneMux
	  port map(v5, v5(1), l); -- A1'B1 + A0'B0 (A1 XNOR B1)
-- ------------------------------------------------------------



-- Evaluating e -----------------------------------------------
	-- e = (A0 XNOR B0) (A1 XNOR B1)
	  mux_e_and : TwoByOneMux
	  port map(xnorAB,xnorAB(0),e);
-- ------------------------------------------------------------



-- Evaluating g (greater than) -----------------------------------
	-- l = A1 B1' + A0 B0' (A1 XNOR B1)
	  v6(0) <= a(1);
	  v6(1) <= bc(1);
	  v7(0) <= a(0);
	  v7(1) <= bc(0);

	  mux_and3 : TwoByOneMux
	  port map(v6, v6(0), A_Bcomp(1)); -- A1 B1'
	  mux_and4 : TwoByOneMux
	  port map(v7, v7(0), A_Bcomp(0)); -- A0 B0'
	  
	  v8(0) <= A_Bcomp(0);
	  v8(1) <= xnorAB(1);

	  mux_and5 : TwoByOneMux
	  port map(v8, v8(0), x2); -- A0 B0' (A1 XNOR B1)

	  v9(0) <= x1;
	  v9(1) <= Acomp_B(1);

	  mux_or1 : TwoByOneMux
	  port map(v9, v9(1), g); -- A1 B1' + A0 B0' (A1 XNOR B1)
-- ------------------------------------------------------------
	  
end structure;

	
	
			