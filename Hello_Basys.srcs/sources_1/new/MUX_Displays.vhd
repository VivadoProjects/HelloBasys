----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.11.2018 17:52:22
-- Design Name: 
-- Module Name: MUX_Displays - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_Displays is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           displays : out STD_LOGIC_VECTOR (3 downto 0));
end MUX_Displays;

architecture Behavioral of MUX_Displays is

begin

process(clk, reset)
variable v_displays : std_logic_vector(3 downto 0) := "1110";
begin
if rising_edge(clk) then
    if reset = '1' then
        v_displays := "1110";
    elsif v_displays = "0111" then
        v_displays := "1110";
    else
        v_displays := v_displays(2 downto 0)&'1';
    end if;
end if;

displays <= v_displays(3 downto 0);
end process;
end Behavioral;
