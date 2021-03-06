----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2022 03:58:14 PM
-- Design Name: 
-- Module Name: DigiLock - Behavioral
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

entity DigiLock is
    Port ( 
        clk: in std_logic;
        reset: in std_logic;
        A: in std_logic;
        B: in std_logic;
        C: in std_logic;
       -- SEG_0: out std_logic_vector(3 downto 0);
      --  SEG_1: out std_logic_vector(3 downto 0);
      --  SEG_2: out std_logic_vector(3 downto 0);
      --  SEG_3: out std_logic_vector(3 downto 0)
        SEG0: out std_logic_vector(3 downto 0);
        SEG1: out std_logic_vector(3 downto 0);
        SEG2: out std_logic_vector(3 downto 0);
        SEG3: out std_logic_vector(3 downto 0)
    );
end DigiLock;

architecture Behavioral of DigiLock is

    type Etat is (Init, E0, E1, E2, E3, Ouvert, Alarme);
    signal etat_present: Etat := Init;
    signal etat_prochain: Etat := Init;
    
  --  COMPONENT DEBOUNCE IS
  --    GENERIC(
  --      counter_size  :  INTEGER := 19); --counter size (19 bits gives 10.5ms with 50MHz clock)
  --    PORT(
  --      clk     : IN  STD_LOGIC;  --input clock
  --      button  : IN  STD_LOGIC;  --input signal to be debounced
  --      result  : OUT STD_LOGIC); --debounced signal
   -- END COMPONENT;
    
    signal debounced_A: std_logic;
    signal debounced_B: std_logic;
    signal debounced_C: std_logic;
    signal pressed_value: std_logic_vector(3 downto 0) := "UUUU";
   -- signal resultat_B: std_logic_vector(3 downto 0);
   -- signal resultat_C: std_logic_vector(3 downto 0);
    

begin
    --U1: DEBOUNCE port map(clk => clk, button => A, result => debounced_A);
    --U2: DEBOUNCE port map(clk => clk, button => B, result => debounced_B);
    --U3: DEBOUNCE port map(clk => clk, button => C, result => debounced_C);

    process (clk, reset)
    begin
        if reset = '0' then
            etat_present <= Init;
        elsif rising_edge(clk) then
            etat_present <= etat_prochain;
        end if;
    end process;
    
    --process (debounced_A, debounced_B, debounced_C) 
    process (A, B, C) 
    begin
    -- TODO: Quoi faire quand il presse deux boutons au meme temps ? ajouter des and si besoin 
        if A = '1' then
            pressed_value <= "0001";
        elsif B = '1' then
            pressed_value <= "0010";
        elsif C = '1' then 
            pressed_value <= "0011";
        else 
            pressed_value <= "UUUU";
        end if; 
    end process;
    
    process (etat_present, pressed_value)
   -- variable code: std_logic_vector(15 downto 0) := "0011000100110010";
    variable entree_0: std_logic_vector(3 downto 0);
    variable entree_1: std_logic_vector(3 downto 0);
    variable entree_2: std_logic_vector(3 downto 0);
    variable entree_3: std_logic_vector(3 downto 0);
  --  variable concat: std_logic_vector(15 downto 0);
    variable compteur: integer RANGE 0 TO 4 := 0;
    begin
        case etat_present is 
            when Init =>
                SEG0 <= "0100"; -- 0100 = 4 = L
                SEG1 <= "0000"; -- 0000 = 0 = -
                SEG2 <= "0000";
                SEG3 <= "0000";
                --if resultat_C = '1' then
                --    code := "C";
                --end if;
                if pressed_value /= "UUUU" then
                    entree_0 := pressed_value;
                    SEG0 <= pressed_value;
                    etat_prochain <= E0;
                else 
                    etat_prochain <= Init;
                end if;
            
            when E0 =>     
                --if resultat_A = '1' then
                --    code := code & "A";
                -- etat_prochain <= E1;
               -- end if;
               entree_1 := pressed_value;
               SEG1 <= pressed_value;
               etat_prochain <= E1;
            
            when E1 =>
               -- if resultat_C = '1' then
                 --   code := code & "C";
                   -- etat_prochain <= E2;
                -- end if;
                entree_2 := pressed_value;
                SEG2 <= pressed_value;
                etat_prochain <= E2;
            
            when E2 =>
               -- if resultat_B = '1' then
                 --   code := code & "B";
                 --   etat_prochain <= E3;
                -- end if;
               entree_3 := pressed_value;
               SEG3 <= pressed_value;
               etat_prochain <= E3;
            when E3 => 
                -- concat := E0 & E1 & E2 & E3;
                if entree_0 = "0011" and entree_1 = "0001" and entree_2 = "0011" and entree_3 = "0010" then  -- CODE = 0011000100110010 = CACB
                    etat_prochain <= Ouvert;
                elsif compteur = 3 then
                    etat_prochain <= Alarme;
                else 
                    compteur := compteur + 1;
                    --code := "";
                    etat_prochain <= Init;
                end if; 
                
            when Ouvert =>
                SEG0 <= "0101"; -- 0101 = 5 = O
                SEG1 <= "0101";
                SEG2 <= "0101";
                SEG3 <= "0101";
                --if debounced_A = '1' or debounced_B = '1' or debounced_C = '1' then 
                if A = '1' or B = '1' or C = '1' then
                    etat_prochain <= Init;
                end if;
            
            when Alarme =>
                SEG0 <= "0000"; -- 0101 = 5 = O
                SEG1 <= "0000";
                SEG2 <= "0100"; -- 0100 = 4 = L
                SEG3 <= "0001"; -- 0001 = 1 = A 
         --   when others =>
             --   etat_prochain <= Init;
        end case;      
    end process;
    
end Behavioral;
