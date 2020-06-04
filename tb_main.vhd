library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use STD.TEXTIO.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;

entity tb_main is

end tb_main;

architecture Behavioral of tb_main is

component main 
Port (
    password_in:            in std_logic_vector (11 downto 0);
    passwordSetupButton:    in std_logic;
    armModeButton:          in std_logic;
    doorOpenButton:         in std_logic;
    passwordEntryButton:    in std_logic;
    clk:                    in std_logic;
    resetButtonDOM:         in std_logic;
    password_out:           out std_logic_vector (11 downto 0);
    statusLED:              out std_logic;
    secondStatusLED:        out std_logic;
    attempOneLED:           out std_logic;
    attempTwoLED:           out std_logic;
    attempThreeLED:         out std_logic;
    alarm:                  out std_logic        
);
end component;
signal passwordSetupButton,armModeButton,doorOpenButton,passwordEntryButton,resetButtonDOM: std_logic:= '0';
signal clk: std_logic;
signal statusLED,secondStatusLED,attempOneLED,attempTwoLED,attempThreeLED,alarm: std_logic;
signal password_in:std_logic_vector (11 downto 0):= "000000000000";
signal password_out:std_logic_vector (11 downto 0);

-----------------------------------------------------------------------
constant clk_period: time:= 10ns;
file file_input    : text;
file file_output   : text;

begin
DUT: main port map(password_in,passwordSetupButton,armModeButton,doorOpenButton
                   ,passwordEntryButton,clk,resetButtonDOM, password_out,statusLED
                   ,secondStatusLED,attempOneLED, attempTwoLED, attempThreeLED, alarm);
clk_process:process
begin
    clk <= '1';
    wait for clk_period/2;
    clk <= '0';
    wait for clk_period/2;
end process;

reading_writing:process
variable l_in:line;
variable l_out:line;
variable l_space:character;
variable vpasswordSetupButton,varmModeButton,vdoorOpenButton:std_logic;
variable vpasswordEntryButton,vresetButtonDOM:std_logic;
variable vpassword_in:std_logic_vector (11 downto 0); 
begin
file_open(file_input, "C:\Users\mailf\Documents\simulation.txt", read_mode);
file_open(file_output, "C:\Users\mailf\Documents\result.txt", write_mode);
While not endfile(file_input) loop
    readline(file_input, l_in);
    read(l_in, vpassword_in);
    read(l_in, l_space);
    read(l_in, vpasswordSetupButton);
    read(l_in, l_space);
    read(l_in, varmModeButton);
    read(l_in, l_space);
    read(l_in, vdoorOpenButton);
    read(l_in, l_space);
    read(l_in, vpasswordEntryButton);
    read(l_in, l_space);
    read(l_in, vresetButtonDOM);
    --assign the read instance to inputs
    password_in<=vpassword_in;
    passwordSetupButton<=vpasswordSetupButton;
    armModeButton<=varmModeButton;
    doorOpenButton<=vdoorOpenButton;
    passwordEntryButton<=vpasswordEntryButton;
    resetButtonDOM<=vresetButtonDOM;
    wait for clk_period;
    -- write outputs to the txt file
    write(l_out,password_out);
    write(l_out,' ');
    write(l_out,statusLED);
    write(l_out,string'(" "));
    write(l_out,secondStatusLED);
    write(l_out,string'(" "));
    write(l_out,attempOneLED);
    write(l_out,string'(" "));
    write(l_out,attempTwoLED);
    write(l_out,string'(" "));
    write(l_out,attempThreeLED);
    write(l_out,string'(" "));
    write(l_out,alarm);
    writeline(file_output, l_out);
end loop;
file_close(file_input);
file_close(file_output);
wait;
end process; 
end Behavioral;
