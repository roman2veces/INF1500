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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ADD is
Port    (
            A : in std_logic_vector(3 downto 0);
            B : in std_logic_vector(3 downto 0);
            Op : in std_logic;
            Z : out std_logic;
            S : out std_logic_vector(3 downto 0);
            Cout : out std_logic
           
        );
end ADD;

architecture FlotDeDonnees of ADD is

component FullAdder1BB is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           Cin : in STD_LOGIC;
           S : out STD_LOGIC;
           Cout : out STD_LOGIC);
end component;

signal cout0 , cout1 , cout2 , cout3 : std_logic;
signal B0 , B1 , B2 , B3 : std_logic;
signal S0 , S1 ,S2 , S3 : std_logic;

begin
     B0 <= B(0) XOR Op;
     B1 <= B(1) XOR Op;
     B2 <= B(2) XOR Op;
     B3 <= B(3) XOR Op;
     
     Add0 : FullAdder1BB port map( A => A(0), B => B(0), Cin => Op,    S => S0, Cout=> cout0);
     Add1 : FullAdder1BB port map( A => A(1), B => B(1), Cin => cout0, S => S1, Cout=> cout1);
     Add2 : FullAdder1BB port map( A => A(2), B => B(2), Cin => cout1, S => S2, Cout=> cout2);
     Add3 : FullAdder1BB port map( A => A(3), B => B(3), Cin => cout2,  S => S3, Cout=> cout3);
     
     Cout <= cout3 XOR Op;
     
     Z <= NOT(S0 OR S1 OR S2 OR S3);
     S <= S3 & S2 & S1 & S0;
     
   
end FlotDeDonnees;
