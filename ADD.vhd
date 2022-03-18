----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/15/2022 12:16:44 PM
-- Design Name:
-- Module Name: FullAdder4BB - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is
    Port(
        A : in UNSIGNED(3 downto 0);
        B : in UNSIGNED(3 downto 0);
        S : out UNSIGNED(4 downto 0)  
    );
end ADD;

architecture FlotDeDonnees of ADD is

signal A_entier: integer;
signal B_entier: integer;

begin
     A_entier <= to_integer(A);
     B_entier <= to_integer(B);      
     S <= to_unsigned(A_entier + B_entier, S'length);
end FlotDeDonnees;
