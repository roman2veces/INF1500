----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2022 08:32:11 PM
-- Design Name: 
-- Module Name: NO_ZEROS - FlotDeDonnees
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NO_ZEROS is
  Port ( 
    A: in unsigned(3 downto 0);
    no_zeros: out integer
  );
end NO_ZEROS;

architecture FlotDeDonnees of NO_ZEROS is
    
begin
    with A select 
    no_zeros <=
    4 when "0000",
    3 when "0001",
    3 when "0010",
    2 when "0011",
    3 when "0100",
    2 when "0101",
    2 when "0110",
    1 when "0111",
    3 when "1000",
    2 when "1001",
    2 when "1010",
    1 when "1011",
    2 when "1100",
    1 when "1101",
    1 when "1110",
    0 when "1111",
    0 when others; 

end FlotDeDonnees;
