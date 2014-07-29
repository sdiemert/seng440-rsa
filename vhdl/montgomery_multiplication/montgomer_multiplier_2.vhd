----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:41:08 07/21/2014 
-- Design Name: 
-- Module Name:    montgomer_multiplier_2 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity montgomer_multiplier_2 is
	 GENERIC (BITS: integer := 64);
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  start : in STD_LOGIC;
			  ready : out STD_LOGIC;
           multiplier : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           multiplicand : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           modulus : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           product : out  STD_LOGIC_VECTOR (BITS-1 downto 0));
end montgomer_multiplier_2;

architecture Behavioral of montgomer_multiplier_2 is
signal setup : STD_LOGIC;
	signal multiplier_r, multiplicand_r, modulus_r, product_c : STD_LOGIC_VECTOR(BITS-1 downto 0);
	-- We use multiplicand and modulus as constants.
	signal product_sum, sum_temp1, sum_temp2, sum_temp3, product_result : STD_LOGIC_VECTOR(BITS-1 downto 0);
begin
	product <= product_c;

	with multiplier_r(0) select
		sum_temp1 <= product_sum + multiplicand_r when '1',
					    product_sum when others;
	
	with sum_temp1(0) select
		sum_temp2 <= sum_temp1 + modulus_r when '1',
						 sum_temp1 when others;
	
	product_result <= '0' & sum_temp3(BITS-1 downto 1);
	
	ready <= setup;

	process (clk)
	begin
		if (clk'event and clk='1') then
			if setup = '1' then
				if start = '1' then
					multiplier_r <= multiplier;
					multiplicand_r <= multiplicand;
					modulus_r <= modulus;
					product_sum <= "0000000000000000000000000000000000000000000000000000000000000000";
					setup <= '0';
				end if;
			else
				if multiplier_r = 0 then
					product_c <= product_result;
					setup <= '1';
				else
					multiplier_r <= '0' & multiplier_r(BITS-1 downto 1);
					product_sum <= product_result;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

