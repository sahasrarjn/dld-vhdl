library ieee, std;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity ASCII_Read_test is
end entity;

architecture reader of ASCII_Read_test is
	component rl_encoder
		port (a: in std_logic_vector (7 downto 0); clk:in std_logic;z: out std_logic_vector (7 downto 0) ; dvl:out std_logic);
	end component;
	signal input_sig, output_sig: std_logic_vector (7 downto 0);
	signal clk : std_logic;
	signal dvl : std_logic;
begin
	dut_instance: rl_encoder
		port map (a => input_sig,clk => clk, z=> output_sig, dvl => dvl);
	
	process
		file input_file: text open read_mode is "/home/sibasis/Desktop/Lab/in.txt";
		file output_file: text open write_mode is "/home/sibasis/Desktop/Lab/op.txt";
		variable input_line, output_line: line;
		variable input_var, output_var : std_logic_vector (7 downto 0);
	
	begin
		while not endfile(input_file) loop
			readline (input_file, input_line);
			read (input_line, input_var);
			input_sig <= input_var;
			clk <= '1'; 
			wait for 20 ns;
			output_var := output_sig;
			if(dvl = '1') then 
				write (output_line, output_var);
				writeline (output_file, output_line);
			end if;
			clk <= '0';
			wait for 20 ns;
		end loop;
	
	wait;
	end process;

end architecture;
