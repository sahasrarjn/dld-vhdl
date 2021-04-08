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
	signal cnt2: natural range 0 to 63:=0; --The first counter that we will use to track size of buffer
   signal cnt3 :natural range 0 to 63:=0;	--The second counter that we will use to track the point upto which we have read
	signal ESC : std_logic_vector(7 downto 0) := "00011011"; --The ESC symbol
	signal last :std_logic_vector(7 downto 0) := "00000000"; --A variable to keep track of symbol in the last line
	signal first :std_logic := '0'; --A counter to keep track of first input only
	signal dvl2, dvl3: std_logic; --Data valid lines

begin
	process(clk)
	
	type op_arr is array (0 to 63) of std_logic_vector(7 downto 0); --output array buffer of size 64*7 bits
	variable op_buff: op_arr; --Initialsiation of buffer array
	variable cnt_out :natural range 0 to 63:=0; -- Variable to keep count of number of repeatitions
	
	begin
		if(rising_edge(clk)) then --read when clock is set
		--11111111 is a special symbol(which will never appear in the input) and has been used to know when the input
		--file has ended. So after all the lines are read by the input file it keeps on sending 11111111. After that 
		--we just keep on flushing the output buffer without applying any logic to the 11111111 input
			if(last = "11111111") then
				if(cnt3 < cnt2) then  --flush the output buffer
					if(op_buff(cnt3) = "11111111") then 
						dvl2 <= '0';
					else
						dvl2 <= '1';
					end if;
					z <= op_buff(cnt3); 
					cnt3 <= cnt3 + 1;
				else
					dvl2 <= '0';
					z<="11111111"; --to notify the input that flushing is over
				end if;
			else
				if(first = '1') then  --for the first line of input we don't have to check any previous values
					if(a = last) then --if current line is same as last line
						if(cnt_out = 15) then --as specified in the question after 15 repeatitions, restart counting and put
							op_buff(cnt2) := ESC; --o/p in buffer
							op_buff(cnt2+1) := std_logic_vector(to_unsigned(cnt_out,8));
							op_buff(cnt2+2) := last;
							cnt2 <= cnt2 + 3;
							cnt_out := 0;
						end if;
					else --if current line is not equal to last line, we have to stop the counter and put last symbol in buffer
						if(last = ESC) then --if last was ESC, then we have to simply put it in buffer
							op_buff(cnt2) := ESC;
							op_buff(cnt2+1) := std_logic_vector(to_unsigned(cnt_out,8));
							op_buff(cnt2+2) := ESC;
							cnt2 <= cnt2 + 3;
							cnt_out := 0;
							last <= a;
						else -- if last was not ESC, then the lines put in buffer depend upon frequency of previous symbol
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
					
					cnt_out := cnt_out + 1; --Increase the counter after reading each symbol
			
					if(cnt3 < cnt2) then --During each cycle print out a line from the output buffer if buffer non-empty
						dvl2 <= '1';
						z <= op_buff(cnt3); 
						cnt3 <= cnt3 + 1;
					else
						dvl2 <= '0';
					end if;
				else 
					first <= '1'; --after the first bit is read set first to 1 so that it enters the if after the first element only
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






