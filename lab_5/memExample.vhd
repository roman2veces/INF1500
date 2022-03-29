----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/22/2022 10:17:23 AM
-- Design Name: 
-- Module Name: memExample - Behavioral
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

entity memExample is
    Port ( CLK, RST : in STD_LOGIC;
           E : in STD_LOGIC;
           S : out STD_LOGIC);
end memExample;

architecture Behavioral of memExample is

    type Etat is (E0, E1);
    signal Ep, Ef: Etat := E0;
    signal printM : integer;

begin
    process(CLK, RST)
    begin
        if(RST = '1') then
            Ep <= E0;
        elsif CLK'event and CLK = '1' then
            Ep <= Ef;
        end if;
    end process;
    
    process(Ep, E)
        variable mem : integer := 0;
    begin
        case Ep is
            when E0 =>
                S <= '0';
                if E = '1' then
                    Ef <= E1;
                    mem := 1;
                else
                    Ef <= E0;
                    mem := 0;
                end if;
            when E1 =>
                S <= '1';
                if E = '1' then
                    if mem = 3 then
                        Ef <= E0;
                    else
                        Ef <= E1;
                        mem := mem + 1;
                    end if;
                else
                    Ef <= E1;
                end if;
            when others =>
                Ef <= E0;
        end case;
        printM <= mem;
    end process;
        

end Behavioral;
