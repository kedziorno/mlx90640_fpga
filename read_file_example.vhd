library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
.
.
.
.
p_read : process(rstb,clk)
--------------------------------------------------------------------------------------------------
constant NUM_COL                : integer := 2;   -- number of column of file

type t_integer_array       is array(integer range <> )  of integer;
file test_vector                : text open read_mode is "file_name.txt";
variable row                    : line;
variable v_data_read            : t_integer_array(1 to NUM_COL);
variable v_data_row_counter     : integer := 0;


begin

  
  if(rstb='0') then

    v_data_row_counter     := 0;
    v_data_read            := (others=> -1);

    i_op1                  <= (others=>'0');
    i_op2                  <= (others=>'0');
  ------------------------------------
  elsif(rising_edge(clk)) then
    
    if(ena = '1') then  -- external enable signal
    
    -- read from input file in "row" variable
      if(not endfile(test_vector)) then
        v_data_row_counter := v_data_row_counter + 1;
        readline(test_vector,row);
      end if;
    
    -- read integer number from "row" variable in integer array
      for kk in 1 to NUM_COL loop
        read(row,v_data_read(kk));
      end loop;

      value1_std_logic_8_bit    <= conv_std_logic_vector(v_data_read(1),8);
      value2_std_logic_8_bit    <= conv_std_logic_vector(v_data_read(2),8);

    end if;
    
  end if;
end process p_read;

