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
        A: in std_logic_vector(3 downto 0);
        B: in std_logic_vector(3 downto 0);
        C: in std_logic_vector(4 downto 0);
        D: in std_logic_vector(4 downto 0);
        E: in std_logic_vector(4 downto 0);
        SEL: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(4 downto 0)
    );
end MUX_5;

architecture FlotDeDonnees of MUX_5 is
    signal A_5BITS: std_logic_vector(4 downto 0);
    signal B_5BITS: std_logic_vector(4 downto 0);
begin
    A_5BITS <= "0" & A;
    B_5BITS <= "0" & B;
    
    with SEL select S <= 
    A_5BITS when "000",
    B_5BITS when "001",
    C when "010", -- ADD
    D when "011", -- BIT_CPT
    E when "100", -- BIT_PAR
    "1111" when others;
    
end FlotDeDonnees;
