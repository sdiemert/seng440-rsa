--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:59:48 07/18/2014
-- Design Name:   
-- Module Name:   /home/ggollmer/SENG440/seng440-rsa/vhdl/montgomery_multiplication/montgomery_multiplier_TB.vhd
-- Project Name:  montgomery_multiplication
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: montgomery_multiplier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY montgomery_multiplier_TB IS
END montgomery_multiplier_TB;
 
ARCHITECTURE behavior OF montgomery_multiplier_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT montgomery_multiplier
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         start : IN  std_logic;
         ready : OUT  std_logic;
         multiplier : IN  std_logic_vector(63 downto 0);
         multiplicand : IN  std_logic_vector(63 downto 0);
         modulus : IN  std_logic_vector(63 downto 0);
         product : OUT  std_logic_vector(63 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal start : std_logic := '0';
   signal multiplier : std_logic_vector(63 downto 0) := (others => '0');
   signal multiplicand : std_logic_vector(63 downto 0) := (others => '0');
   signal modulus : std_logic_vector(63 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal product : std_logic_vector(63 downto 0);

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: montgomery_multiplier PORT MAP (
          clk => clk,
          reset => reset,
          start => start,
          ready => ready,
          multiplier => multiplier,
          multiplicand => multiplicand,
          modulus => modulus,
          product => product
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for clk_period*10;
		
		multiplier <= "0000000000000000000000000000000000000000000000000000000000000000";
		multiplicand <= "0000000000000000000000000000000000000000000000000000000000000000";
		modulus <= "0000000000000000000000000000000000000000000000000000000000000000";
		
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for clk_period*100;

      -- insert stimulus here
		multiplier <= "0000000000000000000000000000000000000000000000000000000001111011"; --123
		multiplicand <= "0000000000000000000000000000000000000000000000000000000010000000"; --128
		modulus <= "0000000000000000000000000000000000000000000000000001100101000001"; --6465
		
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for clk_period*100;
		
		-- insert stimulus here
		multiplier <= "0000000000000000000000000000000000000000000000111001011110101000"; --235432
		multiplicand <= "0000000000000000000000000000000000000000000000001011001111011101"; --46045
		modulus <= "0000000000000000000000000000000000000000000010000001011100011100"; --530204
		
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for clk_period*100;
		
		-- insert stimulus here
		multiplier <= "0000000000000000000000000000000000000000000000111001011110101000"; --235432
		multiplicand <= "0000000000000000000000000000000000000000000000001011001111011101"; --46045
		modulus <= "0000000000000000000000000000000000000000000000000000010010110100"; --1204
		
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for clk_period*100;
		
		-- insert stimulus here
		multiplier <= "0000000000000000000001000010110100111110111001001111000111011100"; --4592375230940
		multiplicand <= "0000000000000000000111110000001001110000110001101100110001110000"; --34095342472304
		modulus <= "0000000000000000110100011110111010111000111101000100101001101100"; --230823235439212
		
		start <= '1';
		wait for clk_period;
		start <= '0';
		
		wait for clk_period*100;
		
		multiplier <= "0000000000000000000000000000000000000000000000000000000000000000";
		multiplicand <= "0000000000000000000000000000000000000000000000000000000000000000";
		modulus <= "0000000000000000000000000000000000000000000000000000000000000000";
		
		start <= '1';
		wait for clk_period;
		start <= '0';

      wait;
   end process;

END;
