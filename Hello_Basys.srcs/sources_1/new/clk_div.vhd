----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Heleno da Silva Morais
-- 
-- Create Date: 11/11/2018 02:50:47 PM
-- Design Name: 
-- Module Name: clk_div - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: This module was implemented to divide the clock to a generic value;
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
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_div is
generic (clk_gen : std_logic_vector(27 downto 0) := "0000001011011100011011000000");
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end clk_div;

architecture Behavioral of clk_div is

signal count : std_logic_vector(28 downto 0) := (others => '0');
signal s_clk_out : std_logic := '0';

begin
process(clk, reset)
begin
    if rising_edge(clk) then
        if reset = '1' then
            count <= (others => '0');
        elsif count = clk_gen then
            s_clk_out <= NOT(s_clk_out);
            count <= (others => '0');
        else
            count <= count + '1';
        end if;

    end if;
end process;

clk_out <= s_clk_out;

end Behavioral;
