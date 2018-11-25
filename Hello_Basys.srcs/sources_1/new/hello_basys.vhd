----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.11.2018 15:41:05
-- Design Name: 
-- Module Name: hello_basys - Behavioral
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

entity hello_basys is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           displays : out STD_LOGIC_VECTOR (3 downto 0);
           segments : out STD_LOGIC_VECTOR (7 downto 0));
end hello_basys;

architecture Behavioral of hello_basys is

component clk_div is 
generic (clk_gen : std_logic_vector(27 downto 0) := "0000001011011100011011000000");
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk_out : out STD_LOGIC);
end component;

component counter is
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       count : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Deco_7seg is
    Port ( count : in STD_LOGIC_VECTOR (3 downto 0);
       segments : out STD_LOGIC_VECTOR ( 7 downto 0));
end component;

component MUX_Displays is
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       displays : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux_4to1 is
 Port ( clk : in STD_LOGIC;
          reset : in STD_LOGIC;
          thousand : in STD_LOGIC_VECTOR (3 downto 0);
          hundred : in STD_LOGIC_VECTOR (3 downto 0);
          tens : in STD_LOGIC_VECTOR (3 downto 0);
          unit : in STD_LOGIC_VECTOR (3 downto 0);
          mux_out : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component mux_15to4 is
    Port ( clk : in STD_LOGIC;
       reset : in STD_LOGIC;
       thousand : out STD_LOGIC_VECTOR (3 downto 0);
       hundred : out STD_LOGIC_VECTOR (3 downto 0);
       tens : out STD_LOGIC_VECTOR (3 downto 0);
       unit : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal s_mux_out : std_logic_vector(3 downto 0) := "0000";
signal s_thousand : std_logic_vector(3 downto 0) := "0000";
signal s_hundred : std_logic_vector(3 downto 0) := "0000";
signal s_tens : std_logic_vector(3 downto 0) := "0000";
signal s_unit : std_logic_vector(3 downto 0) := "0000";
signal s_clk_div : std_logic := '0';
signal s_clk_disp : std_logic := '0';

begin

set_string: mux_15to4 Port Map(
       clk => s_clk_div,
       reset => reset,
       thousand => s_thousand,
       hundred => s_hundred,
       tens => s_tens,
       unit => s_unit
);

set_disps: mux_4to1 Port Map(
       clk => s_clk_disp,
       reset => reset,
       thousand => s_thousand,
       hundred => s_hundred,
       tens => s_tens,
       unit => s_unit,
       mux_out => s_mux_out
);

decoder: Deco_7seg Port Map(
       count => s_mux_out,   
       segments => segments
);

clk_2_5Hz: clk_div generic map (clk_gen => "0010011000100101101000000000")
    Port map( clk => clk,
           reset => reset,
           clk_out => s_clk_div);
clk_120Hz: clk_div generic map (clk_gen => "0000000000110010101010001100")
    Port map( clk => clk,
           reset => reset,
           clk_out => s_clk_disp);
           
mux_disp: MUX_Displays port map(
           clk => s_clk_disp,
           reset => reset,
           displays => displays
);
end Behavioral;
