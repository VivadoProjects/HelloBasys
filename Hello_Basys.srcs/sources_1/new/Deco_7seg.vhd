----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.11.2018 21:30:01
-- Design Name: 
-- Module Name: Deco_7seg - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Deco_7seg is
    Port ( count : in STD_LOGIC_VECTOR (3 downto 0);
           segments : out STD_LOGIC_VECTOR ( 7 downto 0));
end Deco_7seg;

architecture Behavioral of Deco_7seg is

begin

process(count)
begin
    case count is
                                 --abcdefg.
        when "0000" => segments <= "10010001"; --H
        when "0001" => segments <= "01100001"; --E
        when "0010" => segments <= "11100011"; --L
        when "0011" => segments <= "11100011"; --L
        when "0100" => segments <= "00000011"; --O
        when "0101" => segments <= "11000001"; --b
        when "0110" => segments <= "00010001"; --A
        when "0111" => segments <= "01001001"; --S
        when "1000" => segments <= "10001001"; --Y
        when "1001" => segments <= "01001001"; --S
        when "1010" => segments <= "00001101"; --3
        when others => segments <= "11111111"; --blank
    end case;
end process;

end Behavioral;
