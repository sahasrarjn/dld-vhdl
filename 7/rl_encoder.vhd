library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity rl_encoder is
	port (	a: in std_logic_vector (7 downto 0); 
			clk: in std_logic;
			z: out std_logic_vector (7 downto 0);
			dvl: out std_logic
			);
end entity;

architecture behave of rl_encoder is
	signal cnt2: natural range 0 to 63:=0;
   signal cnt3 :natural range 0 to 31:=0;
	signal ESC : std_logic_vector(7 downto 0) := "00011011";
	signal last :std_logic_vector(7 downto 0) := "00000000";
	signal first :std_logic := '0';
	signal dvl2, dvl3: std_logic;

begin
	process(clk)
	
	type op_arr is array (0 to 63) of std_logic_vector(7 downto 0);
	variable op_buff: op_arr;
	variable cnt_out :natural range 0 to 31:=0;
	
	begin
		if(rising_edge(clk)) then
			if(last = "11111111") then
				if(cnt3 < cnt2) then
					dvl2 <= '1';
					z <= op_buff(cnt3); 
					cnt3 <= cnt3 + 1;
				else
					dvl2 <= '0';
					z<="11111111";
				end if;
			else
				if(first = '1') then
					if(a = last) then
						if(cnt_out = 15) then
							op_buff(cnt2) := ESC;
							op_buff(cnt2+1) := std_logic_vector(to_unsigned(cnt_out,8));
							op_buff(cnt2+2) := last;
							cnt2 <= cnt2 + 3;
							cnt_out := 0;
						end if;
					else
						if(last = ESC) then
							op_buff(cnt2) := ESC;
							op_buff(cnt2+1) := std_logic_vector(to_unsigned(cnt_out,8));
							op_buff(cnt2+2) := ESC;
							cnt2 <= cnt2 + 3;
							cnt_out := 0;
							last <= a;
						else
							if(cnt_out > 2) then
								op_buff(cnt2) := ESC;
								op_buff(cnt2+1) := std_logic_vector(to_unsigned(cnt_out,8));
								op_buff(cnt2+2) := last;
								cnt2 <= cnt2 + 3;
								cnt_out := 0;
								last <= a;
							elsif(cnt_out = 2) then
								op_buff(cnt2) := last;
								op_buff(cnt2+1) := last;
								cnt2 <= cnt2 + 2;
								cnt_out := 0;
								last <= a;
							else
								op_buff(cnt2) := last;
								cnt2 <= cnt2 + 1;
								cnt_out := 0;
								last <= a;
							end if;
						end if;
					end if;
					
					cnt_out := cnt_out + 1; 
			
					if(cnt3 < cnt2) then
						dvl2 <= '1';
						z <= op_buff(cnt3); 
						cnt3 <= cnt3 + 1;
					else
						dvl2 <= '0';
					end if;
				else 
					first <= '1';
					dvl2 <= '0';
					last <= a;
					cnt_out := cnt_out + 1;
				end if;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if falling_edge(clk) then
			dvl3 <= '0';
		end if;
	end process;
	
	dvl <= dvl2 when clk='1' else dvl3;
end architecture;






