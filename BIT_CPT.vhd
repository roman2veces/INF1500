----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2022 04:04:55 PM
-- Design Name: 
-- Module Name: BIT_CPT - Behavioral
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

entity BIT_CPT is
    Port ( 
        A: in unsigned(3 downto 0);
        B: in unsigned(3 downto 0);
        S: out unsigned(4 downto 0)
    );
end BIT_CPT;

architecture FlotDeDonnees of BIT_CPT is
signal no_zeros_A: integer; 
signal no_zeros_B: integer; 
begin    
    with A select 
    no_zeros_A <=
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
    0 when others; -- There are not really others

    with B select 
    no_zeros_B <=
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
    0 when others; -- There are not really others
    -- Maybe convert to std_logic_vector
   S <= to_unsigned(no_zeros_A + no_zeros_B, S'length);
    
end FlotDeDonnees;
