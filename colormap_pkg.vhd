library IEEE;
use IEEE.STD_LOGIC_1164.all;

use work.global_package.all;

package colormap_pkg is

-- XXX generated from gradient.py
constant colormap_rom : t_color_map_rom_type_signed := (
x"000005",
x"000005",
x"000006",
x"000006",
x"000006",
x"000006",
x"000006",
x"000006",
x"000006",
x"000006",
x"000006",
x"000007",
x"000007",
x"000007",
x"000007",
x"000007",
x"000007",
x"000007",
x"000007",
x"000008",
x"000008",
x"000008",
x"000008",
x"000008",
x"000008",
x"000008",
x"000008",
x"000009",
x"000009",
x"000009",
x"000009",
x"000009",
x"000009",
x"000009",
x"00010a",
x"00010a",
x"00010a",
x"00010a",
x"00010a",
x"00010a",
x"00010a",
x"00010a",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010b",
x"00010c",
x"00010c",
x"00010c",
x"00010c",
x"00010c",
x"00010c",
x"00020c",
x"00020c",
x"00020c",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020d",
x"00020e",
x"00020e",
x"00020e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030e",
x"00030f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00040f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00050f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00060f",
x"00070f",
x"00070f",
x"00070f",
x"00070f",
x"00070f",
x"00070f",
x"00070f",
x"00070f",
x"00080f",
x"00080e",
x"00080e",
x"00080e",
x"00080e",
x"00080e",
x"00080e",
x"00080e",
x"00090e",
x"00090e",
x"00090e",
x"00090e",
x"00090e",
x"00090e",
x"00090e",
x"01090d",
x"010a0d",
x"010a0d",
x"010a0d",
x"010a0d",
x"010a0d",
x"010a0d",
x"010a0d",
x"010b0d",
x"010b0d",
x"010b0c",
x"010b0c",
x"010b0c",
x"010b0c",
x"010b0c",
x"010b0c",
x"010b0c",
x"010c0c",
x"010c0c",
x"010c0b",
x"010c0b",
x"010c0b",
x"020c0b",
x"020c0b",
x"020c0b",
x"020d0b",
x"020d0b",
x"020d0a",
x"020d0a",
x"020d0a",
x"020d0a",
x"020d0a",
x"020d0a",
x"020d0a",
x"020d0a",
x"020e09",
x"020e09",
x"030e09",
x"030e09",
x"030e09",
x"030e09",
x"030e09",
x"030e09",
x"030e08",
x"030e08",
x"030e08",
x"030e08",
x"030f08",
x"030f08",
x"040f08",
x"040f08",
x"040f07",
x"040f07",
x"040f07",
x"040f07",
x"040f07",
x"040f07",
x"040f07",
x"050f07",
x"050f06",
x"050f06",
x"050f06",
x"050f06",
x"050f06",
x"050f06",
x"050f06",
x"050f06",
x"060f06",
x"060f05",
x"061005",
x"061005",
x"061005",
x"061005",
x"061005",
x"071005",
x"071005",
x"071005",
x"071004",
x"071004",
x"071004",
x"071004",
x"081004",
x"081004",
x"081004",
x"081004",
x"081004",
x"081004",
x"091003",
x"091003",
x"091003",
x"091003",
x"090f03",
x"090f03",
x"0a0f03",
x"0a0f03",
x"0a0f03",
x"0a0f03",
x"0a0f03",
x"0a0f03",
x"0b0f03",
x"0b0f02",
x"0b0f02",
x"0b0f02",
x"0b0f02",
x"0c0f02",
x"0c0f02",
x"0c0f02",
x"0c0f02",
x"0c0f02",
x"0d0f02",
x"0d0f02",
x"0d0f02",
x"0d0f02",
x"0d0f02",
x"0e0f02",
x"0e0f02",
x"0e0f01",
x"0e0f01",
x"0e0f01",
x"0f0f01",
x"0f0f01",
x"0f0f01",
x"0f0f01",
x"100f01",
x"100f01",
x"100f01",
x"100f01",
x"100f01",
x"110f01",
x"110f01",
x"110f01",
x"110f01",
x"120f01",
x"120f01",
x"120f01",
x"120f01",
x"130f01",
x"130f01",
x"130f01",
x"130f01",
x"130f01",
x"140f01",
x"140f01",
x"140f01",
x"140f01",
x"150f00",
x"150f00",
x"150f00",
x"150f00",
x"160f00",
x"160f00",
x"160f00",
x"170f00",
x"170f00",
x"170f00",
x"170f00",
x"180f00",
x"181000",
x"181000",
x"181000",
x"191000",
x"191000",
x"191000",
x"191000",
x"1a1000",
x"1a1000",
x"1a1000",
x"1b1100",
x"1b1100",
x"1b1100",
x"1b1100",
x"1c1100",
x"1c1100",
x"1c1200",
x"1d1200",
x"1d1200",
x"1d1200",
x"1d1201",
x"1e1201",
x"1e1301",
x"1e1301",
x"1f1301",
x"1f1301",
x"1f1301",
x"1f1401",
x"1f1401",
x"1f1401",
x"1f1401",
x"1f1501",
x"1f1501",
x"1f1501",
x"1f1501",
x"1f1601",
x"1f1601",
x"1f1601",
x"1f1601",
x"1f1701",
x"1f1701",
x"1f1701",
x"1f1701",
x"1f1801",
x"1f1801",
x"1f1801",
x"1f1901",
x"1f1902",
x"1f1902",
x"1f1a02",
x"1f1a02",
x"1f1a02",
x"1f1b02",
x"1f1b02",
x"1f1b02",
x"1f1c02",
x"1f1c02",
x"1f1c02",
x"1f1d02",
x"1f1d02",
x"1f1d02",
x"1f1e03",
x"1f1e03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f03",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f04",
x"1f1f05",
x"1f1f05",
x"1f1f05",
x"1f1f05",
x"1f1f05",
x"1f1f05",
x"1f1f05",
x"1f1f06",
x"1f1f06",
x"1f1f06",
x"1f1f06",
x"1f1f06",
x"1f1f06",
x"1f1f07",
x"1f1f07",
x"1f1f07",
x"1f1f07",
x"1f1f07",
x"1f1f07",
x"1f1f08",
x"1f1f08",
x"1f1f08",
x"1f1f08",
x"1f1f08",
x"1f1f09",
x"1f1f09",
x"1f1f09",
x"1f1f09",
x"1f1f09",
x"1f1f0a",
x"1f1f0a",
x"1f1f0a",
x"1f1f0a",
x"1f1f0a",
x"1f1f0b",
x"1f1f0b",
x"1f1f0b",
x"1f1f0b",
x"1f1f0b",
x"1f1f0c",
x"1f1f0c",
x"1f1f0c",
x"1f1f0c",
x"1f1f0d",
x"1f1f0d",
x"1f1f0d",
x"1f1f0d",
x"1f1f0e",
x"1f1f0e",
x"1f1f0e",
x"1f1f0e",
x"1f1f0f",
x"1f1f0f",
x"1f1f0f",
x"1f1f0f",
x"1f1f10",
x"1f1f10",
x"1f1f10",
x"1f1f10",
x"1f1f11",
x"1f1f11",
x"1f1f11",
x"1f1f11",
x"1f1f12",
x"1f1f12",
x"1f1f12",
x"1f1f12",
x"1f1f13",
x"1f1f13",
x"1f1f13",
x"1f1f13",
x"1f1f14",
x"1f1f14",
x"1f1f14",
x"1f1f14",
x"1f1f15",
x"1f1f15",
x"1f1f15",
x"1f1f15",
x"1f1f16",
x"1f1f16",
x"1f1f16",
x"1f1f16",
x"1f1f17",
x"1f1f17",
x"1f1f17",
x"1f1f17",
x"1f1f18",
x"1f1f18",
x"1f1f18",
x"1f1f18",
x"1f1f18",
x"1f1f19",
x"1f1f19",
x"1f1f19",
x"1f1f19",
x"1f1f1a",
x"1f1f1a",
x"1f1f1a",
x"1f1f1a",
x"1f1f1a",
x"1f1f1b",
x"1f1f1b",
x"1f1f1b",
x"1f1f1b",
x"1f1f1b",
x"1f1f1c",
x"1f1f1c",
x"1f1f1c",
x"1f1f1c",
x"1f1f1c",
x"1f1f1c",
x"1f1f1c",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1d",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e",
x"1f1f1e"
);

end colormap_pkg;

package body colormap_pkg is
 
end colormap_pkg;
