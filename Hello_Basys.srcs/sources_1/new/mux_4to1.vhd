----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 18:35:39
-- Design Name: 
-- Module Name: mux_4to1 - Behavioral
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

entity mux_4to1 is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           thousand : in STD_LOGIC_VECTOR (3 downto 0);
           hundred : in STD_LOGIC_VECTOR (3 downto 0);
           tens : in STD_LOGIC_VECTOR (3 downto 0);
           unit : in STD_LOGIC_VECTOR (3 downto 0);
           mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end mux_4to1;

architecture Behavioral of mux_4to1 is

signal sel : std_logic_vector(1 downto 0) := "00";

begin
process(clk, reset)
begin
    if rising_edge(clk) then
        if reset = '1' then
            sel <= "00";
        else
            sel <= sel + '1';
        end if;
    end if;
end process;

with sel select
    mux_out <= unit when "00",
               tens when "01",
               hundred when "10",
               thousand when others;
               

end Behavioral;
