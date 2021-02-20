library work;
use work.all;
library IEEE;
use IEEE.std_logic_1164.all;

entity TestBench is
end TestBench;

architecture tb of TestBench is
    signal a1 , b1 :  std_logic_vector (1 downto 0);
	 signal l1,g1,e1:  std_logic;
 
component FourbitComp is
port ( a, b : in std_logic_vector (1 downto 0);
l, g, e : out std_logic);
end component;


begin
    
 fbc_instance: FourbitComp
port map (a => a1, b=>b1, l=>l1, g=>g1,e=>e1);

process
begin
 a1(0)<='0';
 a1(1)<='0';
 b1(0)<='0';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='0';
 b1(0)<='0';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='0';
 b1(0)<='1';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='0';
 b1(0)<='1';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='0';
 b1(0)<='0';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='0';
 b1(0)<='1';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='0';
 b1(0)<='0';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='0';
 b1(0)<='1';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='1';
 b1(0)<='0';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='1';
 b1(0)<='1';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='1';
 b1(0)<='0';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='0';
 a1(1)<='1';
 b1(0)<='1';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='1';
 b1(0)<='0';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='1';
 b1(0)<='1';
 b1(1)<='0';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='1';
 b1(0)<='0';
 b1(1)<='1';
 wait for 5ns;
 
 a1(0)<='1';
 a1(1)<='1';
 b1(0)<='1';
 b1(1)<='1';
 wait for 5ns;
 
end process;
end tb;
