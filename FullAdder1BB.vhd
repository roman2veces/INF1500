----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date: 03/15/2022 12:21:58 AM
-- Design Name:
-- Module Name: FullAdder1BB - Behavioral
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

entity FullAdder1BB is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end FullAdder1BB;

architecture FlotDeDonnees of FullAdder1BB is

begin

    S <= A XOR B XOR Cin;
        Cout <= (A AND B) OR (A AND Cin) OR (B AND Cin);  
end FlotDeDonnees;
