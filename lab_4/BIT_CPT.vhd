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
-- use IEEE.STD_LOGIC_1164.ALL;
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


component NO_ZEROS
    port(A: in unsigned(3 downto 0); no_zeros: out integer);
end component;

signal no_zeros_A: integer; 
signal no_zeros_B: integer; 

begin    
    U1: NO_ZEROS port map(A => A, no_zeros => no_zeros_A);
    U2: NO_ZEROS port map(A => B, no_zeros => no_zeros_B);
     
    -- Maybe convert to std_logic_vector
   S <= to_unsigned(no_zeros_A + no_zeros_B, S'length);
    
end FlotDeDonnees;
