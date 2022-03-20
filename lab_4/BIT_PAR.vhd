----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/18/2022 02:53:54 PM
-- Design Name: 
-- Module Name: BIT_PAR - FlotDeDonnees
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

entity BIT_PAR is
  Port ( 
        A: in unsigned(3 downto 0);
        B: in unsigned(3 downto 0);
        S: out unsigned(4 downto 0)
   );
end BIT_PAR;

architecture FlotDeDonnees of BIT_PAR is
signal concat: unsigned(7 downto 0);
signal est_pair: std_logic;    
begin
    concat <= A & B;
    est_pair <= NOT (concat(7) XOR concat(6) XOR concat(5) XOR concat(4) XOR concat(3) XOR concat(2) XOR concat(1) XOR concat(0));
    S <= "0000" & est_pair;
end FlotDeDonnees;
