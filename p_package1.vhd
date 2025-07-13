library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package p_package1 is

  -- Settings for device Melexis MLX90640.
  constant c_x_step                     : integer := 20;
  constant c_y_step                     : integer := 20;
  constant c_x                          : integer := 640 / c_x_step; -- 32
  constant c_y                          : integer := 480 / c_y_step; -- 24
  constant c_all_pixels                 : integer := c_x * c_y; -- 768
  constant c_memory_address_bits        : integer := 10;

end package p_package1;

package body p_package1 is
end package body p_package1;
