----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:47:10 07/18/2014 
-- Design Name: 
-- Module Name:    montgomery_multiplier - Behavioral 
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

entity montgomery_multiplier is
	 GENERIC (BITS: integer := 64);
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  start : in STD_LOGIC;
			  ready : out STD_LOGIC;
           multiplier : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           multiplicand : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           modulus : in  STD_LOGIC_VECTOR (BITS-1 downto 0);
           product : out  STD_LOGIC_VECTOR (BITS-1 downto 0));
end montgomery_multiplier;

architecture Behavioral of montgomery_multiplier is
	signal setup : STD_LOGIC := '1';
	signal multiplier_r, multiplicand_r, modulus_r, product_c : STD_LOGIC_VECTOR(BITS-1 downto 0) := (others => '0');
	-- We use multiplicand and modulus as constants.
	signal product_sum, mod_temp, sum_temp1, sum_temp2, product_result, mod_test : STD_LOGIC_VECTOR(BITS-1 downto 0) := (others => '0');
	signal q_result : STD_LOGIC_VECTOR(1 downto 0) := (others => '0');
begin
	product <= product_c;
	
	with multiplier_r(0) select
		q_result <= ( product_sum(0) and multiplicand_r(0) ) & ( product_sum(0) xor multiplicand_r(0) ) when '1',
						'0' & product_sum(0) when others;
	
	with q_result(1) select
		mod_temp <= modulus_r(BITS-2 downto 0) & '0' when '1',
						modulus_r when others;
	
	with multiplier_r(0) select
		sum_temp1 <= product_sum + multiplicand_r when '1',
						 product_sum when others;
	
	with q_result select
		sum_temp2 <= sum_temp1 when "00",
						 sum_temp1 + mod_temp when others;
	
	product_result <= '0' & sum_temp2(BITS-1 downto 1);
	
	ready <= setup;

	process (clk)
	begin
		if (clk'event and clk='1') then
			if setup = '1' then
				if start = '1' then
					multiplier_r <= multiplier;
					multiplicand_r <= multiplicand;
					modulus_r <= modulus;
					mod_test <= modulus;
					product_sum <= "0000000000000000000000000000000000000000000000000000000000000000";
					if not (modulus = (modulus'range => '0')) then
						setup <= '0';
					end if;
				end if;
			else
				mod_test <= '0' & mod_test(BITS-1 downto 1);
				multiplier_r <= '0' & multiplier_r(BITS-1 downto 1);
				product_sum <= product_result;
				if mod_test = (mod_test'range => '0') then
					product_c <= product_sum;
					setup <= '1';
				end if;
			end if;
		end if;
	end process;
end Behavioral;

