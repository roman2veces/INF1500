----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/21/2022 06:36:04 PM
-- Design Name: 
-- Module Name: SEVEN_SEG - FlotDeDonnees
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

entity SEVEN_SEG is
    Port ( 
        premier_nombre: in UNSIGNED(3 downto 0);
        deuxieme_nombre: in UNSIGNED(3 downto 0);
        SEL: in UNSIGNED(2 downto 0);
        SEVEN_SEG: out UNSIGNED(7 downto 0);
        AN: out UNSIGNED(7 downto 0)
    );
end SEVEN_SEG;

architecture FlotDeDonnees of SEVEN_SEG is

-- COMPONENTS
component ADD
    port(
        A : in UNSIGNED(3 downto 0);
        B : in UNSIGNED(3 downto 0);
        S : out UNSIGNED(4 downto 0)
    );
end component;

component BIT_CPT
    Port ( 
        A: in unsigned(3 downto 0);
        B: in unsigned(3 downto 0);
        S: out unsigned(4 downto 0)
    );
end component BIT_CPT;

component BIT_PAR
    Port ( 
          A: in unsigned(3 downto 0);
          B: in unsigned(3 downto 0);
          S: out unsigned(4 downto 0)
     );
end component BIT_PAR;

component MUX_5
    Port ( 
        A: in unsigned(3 downto 0);
        B: in unsigned(3 downto 0);
        ADD: in unsigned(4 downto 0);
        BIT_CPT: in unsigned(4 downto 0);
        BIT_PAR: in unsigned(4 downto 0);
        SEL: in unsigned(2 downto 0);
        S: out unsigned(4 downto 0)
    );
end component MUX_5;

component SEVEN_SEG_CONV
    Port ( 
        A: in unsigned(4 downto 0);
        S: out unsigned(7 downto 0)
    );
end component SEVEN_SEG_CONV;

-- SIGNALS
signal add_resultat: unsigned(4 downto 0);
signal bit_par_resultat: unsigned(4 downto 0);
signal bit_cpt_resultat: unsigned(4 downto 0);
signal caractere_7seg: unsigned(4 downto 0);

begin  

    U1: ADD port map(A => premier_nombre, B => deuxieme_nombre, S => add_resultat);
    U2: BIT_CPT port map(A => premier_nombre, B => deuxieme_nombre, S => bit_cpt_resultat);
    U3: BIT_PAR port map(A => premier_nombre, B => deuxieme_nombre, S => bit_par_resultat);
    U4: MUX_5 port map(
        A => premier_nombre, 
        B => deuxieme_nombre, 
        ADD => add_resultat,
        BIT_PAR => bit_par_resultat,
        BIT_CPT => bit_cpt_resultat,
        SEL => SEL,
        S => caractere_7seg
    );
    U5: SEVEN_SEG_CONV port map(A => caractere_7seg, S => SEVEN_SEG);
    AN <= "11111110";

end FlotDeDonnees;
