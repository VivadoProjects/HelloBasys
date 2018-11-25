----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 18:08:05
-- Design Name: 
-- Module Name: mux_15to4 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mux_15to4 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           thousand : out STD_LOGIC_VECTOR (3 downto 0);
           hundred : out STD_LOGIC_VECTOR (3 downto 0);
           tens : out STD_LOGIC_VECTOR (3 downto 0);
           unit : out STD_LOGIC_VECTOR (3 downto 0));
end mux_15to4;

architecture Behavioral of mux_15to4 is

constant c_blank : std_logic_vector(3 downto 0) := "1111";
constant c_H : std_logic_vector(3 downto 0) := "0000";
constant c_E : std_logic_vector(3 downto 0) := "0001";
constant c_L : std_logic_vector(3 downto 0) := "0010";
constant c_O : std_logic_vector(3 downto 0) := "0100";
constant c_B : std_logic_vector(3 downto 0) := "0101";
constant c_A : std_logic_vector(3 downto 0) := "0110";
constant c_S : std_logic_vector(3 downto 0) := "0111";
constant c_Y : std_logic_vector(3 downto 0) := "1000";
constant c_3 : std_logic_vector(3 downto 0) := "1010";

signal sel : std_logic_vector(3 downto 0) := "0000";
begin

process(clk, reset)
begin
    if rising_edge(clk) then
        if reset = '1' then
            sel <= "0000";
        else
            sel <= sel + '1';
        end if;
    
    end if;
end process;

process(sel)
begin   
case sel is 
    when "0000" => 
                thousand <= c_blank;
                hundred <= c_blank; 
                tens <= c_blank; 
                unit <= c_H;

    when "0001" => 
                thousand <= c_blank;
                hundred <= c_blank; 
                tens <= c_H; 
                unit <= c_E;

    when "0010" => 
                thousand <= c_blank;
                hundred <= c_H; 
                tens <= c_E; 
                unit <= c_L;

    when "0011" => 
                thousand <= c_H;
                hundred <= c_E; 
                tens <= c_L; 
                unit <= c_L;

    when "0100" => 
                thousand <= c_E;
                hundred <= c_L; 
                tens <= c_L; 
                unit <= c_O;

    when "0101" => 
                thousand <= c_L;
                hundred <= c_L; 
                tens <= c_O; 
                unit <= c_blank;

    when "0110" => 
                thousand <= c_L;
                hundred <= c_O; 
                tens <= c_blank; 
                unit <= c_B;

    when "0111" => 
                thousand <= c_O;
                hundred <= c_blank; 
                tens <= c_B; 
                unit <= c_A;

    when "1000" => 
                thousand <= c_blank;
                hundred <= c_B; 
                tens <= c_A; 
                unit <= c_S;

    when "1001" => 
                thousand <= c_B;
                hundred <= c_A; 
                tens <= c_S; 
                unit <= c_Y;

    when "1010" => 
                thousand <= c_A;
                hundred <= c_S; 
                tens <= c_Y; 
                unit <= c_S;

    when "1011" => 
                thousand <= c_S;
                hundred <= c_Y; 
                tens <= c_S; 
                unit <= c_blank;

    when "1100" => 
                thousand <= c_Y;
                hundred <= c_S; 
                tens <= c_blank; 
                unit <= c_3;

    when "1101" => 
                thousand <= c_S;
                hundred <= c_blank; 
                tens <= c_3; 
                unit <= c_blank;

    when others => 
                thousand <= c_blank;
                hundred <= c_3; 
                tens <= c_blank; 
                unit <= c_blank;

end case;
end process;
end Behavioral;
