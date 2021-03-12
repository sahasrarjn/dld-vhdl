--Implementation of 2x1 MUX
library work;
use work.all;

library IEEE;
use IEEE.std_logic_1164.all;

--entity has been declared with a std_logic_vector input and a selection line
entity EightbitKogStonAddSub is
port ( 	a, b : in std_logic_vector (7 downto 0); 
		cin: in std_logic;
		sum: out std_logic_vector (7 downto 0); 
		cout: out std_logic);
end entity;

-- architecture of 8-bit Kogge Stone Adder-Subtractor
architecture structure of EightbitKogStonAddSub is 
-- Declaring necessary variables
    -- Output variables for each stage
    -- Stage 0
    signal g_0 : std_logic_vector(7 downto 0);
    signal p_0 : std_logic_vector(7 downto 0);
    
    -- Stage 1
    signal g1 : std_logic_vector(7 downto 0);
    signal p1 : std_logic_vector(7 downto 0);
    
    -- Stage 2
    signal g2 : std_logic_vector(7 downto 0);
    signal p2 : std_logic_vector(7 downto 0);
    
    -- Stage 3
    signal g3 : std_logic_vector(7 downto 0);
    signal p3 : std_logic_vector(7 downto 0);
    

    signal carry : std_logic_vector(7 downto 0);
    signal carryc : std_logic_vector(7 downto 0);
    signal cinc : std_logic;

    signal def : std_logic_vector(1 downto 0);
    signal v0 : std_logic_vector(7 downto 0);


    -- declared component 2x1 MUX
    component TwoByOneMux
        port(	a : in std_logic;
				b: in std_logic;
				sel : in std_logic;
				z : out std_logic);
    end component;

    -- declared component Carry Generator
    component carryGen
    	port (	ga : in std_logic; 
				pa : in std_logic;
				gb : in std_logic; 
				pb : in std_logic;
				g : out std_logic;
				p : out std_logic);
    end component;
    
	-- declared component Pre Generator
    component generator
    	Port ( 	A : in STD_LOGIC;
           		B : in STD_LOGIC;
           		G_out : out STD_LOGIC;
           		P_out : out STD_LOGIC);
    end component;

    -- declared component Post Generator
    component post_generator
    	Port ( 	g : in STD_LOGIC;
           		p : in STD_LOGIC;
           		c0 : in STD_LOGIC;
           		c : out STD_LOGIC;
           		s : out STD_LOGIC);
    end component;
    

    begin


    gen0 : generator
    port map(a(0),b(0),g_0(0),p_0(0));
	gen1 : generator
	port map(a(1),b(1),g_0(1),p_0(1));
	gen2 : generator
	port map(a(2),b(2),g_0(2),p_0(2));
	gen3 : generator
	port map(a(3),b(3),g_0(3),p_0(3));
	gen4 : generator
	port map(a(4),b(4),g_0(4),p_0(4));
	gen5 : generator
	port map(a(5),b(5),g_0(5),p_0(5));
	gen6 : generator
	port map(a(6),b(6),g_0(6),p_0(6));
	gen7 : generator
	port map(a(7),b(7),g_0(7),p_0(7));

-- -Stage 1----------------------------------------------
	-- store
	g1(0) <= g_0(0);
	p1(0) <= p_0(0);

	-- compute g,p
	cargen11 : carryGen
	port map(g_0(0),p_0(0),g_0(1),p_0(1),g1(1),p1(1));
	cargen12 : carryGen
	port map(g_0(1),p_0(1),g_0(2),p_0(2),g1(2),p1(2));
	cargen13 : carryGen
	port map(g_0(2),p_0(2),g_0(3),p_0(3),g1(3),p1(3));
	cargen14 : carryGen
	port map(g_0(3),p_0(3),g_0(4),p_0(4),g1(4),p1(4));
	cargen15 : carryGen
	port map(g_0(4),p_0(4),g_0(5),p_0(5),g1(5),p1(5));
	cargen16 : carryGen
	port map(g_0(5),p_0(5),g_0(6),p_0(6),g1(6),p1(6));
	cargen17 : carryGen
	port map(g_0(6),p_0(6),g_0(7),p_0(7),g1(7),p1(7));
-- ------------------------------------------------------
	
-- -Stage 2----------------------------------------------
	-- store
	g2(0) <= g1(0);
	p2(0) <= p1(0);
	g2(1) <= g1(1);
	p2(1) <= p1(1);

	-- compute carry
	cargen20 : carryGen
	port map(g1(0),p1(0),g1(2),p1(2),g2(2),p2(2));
	cargen21 : carryGen
	port map(g1(1),p1(1),g1(3),p1(3),g2(3),p2(3));
	cargen22 : carryGen
	port map(g1(2),p1(2),g1(4),p1(4),g2(4),p2(4));
	cargen23 : carryGen
	port map(g1(3),p1(3),g1(5),p1(5),g2(5),p2(5));
	cargen24 : carryGen
	port map(g1(4),p1(4),g1(6),p1(6),g2(6),p2(6));
	cargen25 : carryGen
	port map(g1(5),p1(5),g1(7),p1(7),g2(7),p2(7));
-- ------------------------------------------------------

-- -Stage 2----------------------------------------------
	-- store
	g3(0) <= g2(0);
	p3(0) <= p2(0);
	g3(1) <= g2(1);
	p3(1) <= p2(1);
	g3(2) <= g2(2);
	p3(2) <= p2(2);
	g3(3) <= g2(3);
	p3(3) <= p2(3);

	-- compute carry
	cargen30 : carryGen
	port map(g2(0),p2(0),g2(4),p2(4),g3(4),p3(4));
	cargen31 : carryGen
	port map(g2(1),p2(1),g2(5),p2(5),g3(5),p3(5));
	cargen32 : carryGen
	port map(g2(2),p2(2),g2(6),p2(6),g3(6),p3(6));
	cargen33 : carryGen
	port map(g2(3),p2(3),g2(7),p2(7),g3(7),p3(7));
-- ------------------------------------------------------


-- - Post-processing ------------------------------------
	-- v0(i) = p3(i) AND cin
	and0 : TwoByOneMux
	port map(cin,p3(0),cin,v0(0));
	and1 : TwoByOneMux
	port map(cin,p3(1),cin,v0(1));
	and2 : TwoByOneMux
	port map(cin,p3(2),cin,v0(2));
	and3 : TwoByOneMux
	port map(cin,p3(3),cin,v0(3));
	and4 : TwoByOneMux
	port map(cin,p3(4),cin,v0(4));
	and5 : TwoByOneMux
	port map(cin,p3(5),cin,v0(5));
	and6 : TwoByOneMux
	port map(cin,p3(6),cin,v0(6));
	and7 : TwoByOneMux
	port map(cin,p3(7),cin,v0(7));


	-- carry(i) = g3(i) + v0(i) = g3(i) + p3(i).cin
	or0 : TwoByOneMux
	port map(g3(0),v0(0),v0(0),carry(0));
	or1 : TwoByOneMux
	port map(g3(1),v0(1),v0(1),carry(1));
	or2 : TwoByOneMux
	port map(g3(2),v0(2),v0(2),carry(2));
	or3 : TwoByOneMux
	port map(g3(3),v0(3),v0(3),carry(3));
	or4 : TwoByOneMux
	port map(g3(4),v0(4),v0(4),carry(4));
	or5 : TwoByOneMux
	port map(g3(5),v0(5),v0(5),carry(5));
	or6 : TwoByOneMux
	port map(g3(6),v0(6),v0(6),carry(6));
	or7 : TwoByOneMux
	port map(g3(7),v0(7),v0(7),carry(7));


	-- sum(i) = car(i-1) XOR p_0(i)
	
	-- carryc(i) = carry(i)'
	def(0) <= '1';
	def(1) <= '0';

	not0 : TwoByOneMux
	port map(def(0),def(1),carry(0),carryc(0));
	not1 : TwoByOneMux
	port map(def(0),def(1),carry(1),carryc(1));
	not2 : TwoByOneMux
	port map(def(0),def(1),carry(2),carryc(2));
	not3 : TwoByOneMux
	port map(def(0),def(1),carry(3),carryc(3));
	not4 : TwoByOneMux
	port map(def(0),def(1),carry(4),carryc(4));
	not5 : TwoByOneMux
	port map(def(0),def(1),carry(5),carryc(5));
	not6 : TwoByOneMux
	port map(def(0),def(1),carry(6),carryc(6));
	not7 : TwoByOneMux
	port map(def(0),def(1),carry(7),carryc(7));
	not8 : TwoByOneMux
	port map(def(0),def(1),cin, cinc);


	xor0 : TwoByOneMux
	port map(cin, cinc, p_0(0), sum(0));
	xor1 : TwoByOneMux
	port map(carry(0), carryc(0), p_0(1), sum(1));
	xor2 : TwoByOneMux
	port map(carry(1), carryc(1), p_0(2), sum(2));
	xor3 : TwoByOneMux
	port map(carry(2), carryc(2), p_0(3), sum(3));
	xor4 : TwoByOneMux
	port map(carry(3), carryc(3), p_0(4), sum(4));
	xor5 : TwoByOneMux
	port map(carry(4), carryc(4), p_0(5), sum(5));
	xor6 : TwoByOneMux
	port map(carry(5), carryc(5), p_0(6), sum(6));
	xor7 : TwoByOneMux
	port map(carry(6), carryc(6), p_0(7), sum(7));

	cout <= carry(7);
-- ------------------------------------------------------


end structure;


















	
	
			