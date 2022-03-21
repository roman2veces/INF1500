----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2022 10:48:06 PM
-- Design Name: 
-- Module Name: MUX_5 - FlotDeDonnees
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_5 is
    Port ( 
      A: in unsigned(3 downto 0);
      B: in unsigned(3 downto 0);
      ADD: in unsigned(4 downto 0);
      BIT_CPT: in unsigned(4 downto 0);
      BIT_PAR: in unsigned(4 downto 0);
      SEL: in unsigned(2 downto 0);
      S: out unsigned(4 downto 0)
    );
end MUX_5;

architecture FlotDeDonnees of MUX_5 is

begin    
    with SEL select S <= 
        '0'&A when "000",
        '0'&B when "001",
        ADD when "010",
        BIT_CPT when "011",
        BIT_PAR when "100",
        "11111" when others;
    
end FlotDeDonnees;
