/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                         */
/*  \   \        Copyright (c) 2003-2007 Xilinx, Inc.                 */
/*  /   /        All Right Reserved.                                  */
/* /---/   /\                                                         */
/* \   \  /  \                                                        */
/*  \___\/\___\                                                       */
/**********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *UNISIM_P_0947159679;
char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *WORK_P_0227793272;
char *XILINXCORELIB_P_1032809427;
char *XILINXCORELIB_P_2048898517;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *IEEE_P_3620187407;
char *IEEE_P_3564397177;
char *WORK_P_2110098887;
char *IEEE_P_3972351953;
char *WORK_P_0108441146;
char *IEEE_P_1367372525;
char *IEEE_P_2717149903;
char *UNISIM_P_3222816464;
char *XILINXCORELIB_P_1866012138;
char *XILINXCORELIB_P_0656867652;

int isim_run(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3972351953_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    std_textio_init();
    ieee_p_2717149903_init();
    ieee_p_1367372525_init();
    ieee_p_3564397177_init();
    work_p_0108441146_init();
    work_p_0227793272_init();
    work_p_2110098887_init();
    unisim_p_0947159679_init();
    unisim_p_3222816464_init();
    unisim_a_4097770888_0464044125_init();
    work_a_0497498850_3212880686_init();
    work_a_0220162459_3212880686_init();
    unisim_a_0029838933_2381219257_init();
    work_a_0630564229_3212880686_init();
    unisim_a_3006806048_2381219257_init();
    unisim_a_0833638974_2381219257_init();
    work_a_4199413112_3212880686_init();
    work_a_0197487621_3212880686_init();
    unisim_a_1199549061_2381219257_init();
    work_a_2665643405_3212880686_init();
    work_a_2264182378_3212880686_init();
    unisim_a_0973279122_2381219257_init();
    work_a_1010035007_3212880686_init();
    work_a_2654702125_3212880686_init();
    unisim_a_3879395455_2381219257_init();
    unisim_a_2125124919_2381219257_init();
    work_a_2526614022_3212880686_init();
    work_a_3621914403_3212880686_init();
    work_a_1564529886_3212880686_init();
    work_a_3747699961_3212880686_init();
    work_a_2144189218_3212880686_init();
    work_a_0808878549_3212880686_init();
    unisim_a_0035992271_2381219257_init();
    work_a_0325145940_3212880686_init();
    work_a_0551452866_3212880686_init();
    work_a_0008236414_3212880686_init();
    work_a_3769940401_3212880686_init();
    work_a_3916967954_3212880686_init();
    unisim_a_4080708718_2381219257_init();
    work_a_0485817630_3212880686_init();
    unisim_a_3852261326_0985318662_init();
    work_a_0608724768_3212880686_init();
    work_a_3260136375_3212880686_init();
    unisim_a_3446430675_2381219257_init();
    work_a_3980557777_3212880686_init();
    work_a_2040548282_3212880686_init();
    work_a_1442102507_3212880686_init();
    xilinxcorelib_p_2048898517_init();
    xilinxcorelib_p_1032809427_init();
    xilinxcorelib_p_1866012138_init();
    xilinxcorelib_p_0656867652_init();
    xilinxcorelib_a_3741073727_3212880686_init();
    xilinxcorelib_a_3408174496_3212880686_init();
    xilinxcorelib_a_0872963660_3212880686_init();
    work_a_1005979772_2991578515_init();
    xilinxcorelib_a_1952265279_3212880686_init();
    xilinxcorelib_a_3531994210_3212880686_init();
    xilinxcorelib_a_2083741445_3212880686_init();
    work_a_4100233142_2921188703_init();
    xilinxcorelib_a_4117117575_3212880686_init();
    xilinxcorelib_a_3609620547_3212880686_init();
    xilinxcorelib_a_1961555086_3212880686_init();
    work_a_0918200684_1707197775_init();
    xilinxcorelib_a_1062437367_3212880686_init();
    xilinxcorelib_a_2576040362_3212880686_init();
    xilinxcorelib_a_0926804685_3212880686_init();
    work_a_2172540993_1520121284_init();
    xilinxcorelib_a_3427702201_3212880686_init();
    xilinxcorelib_a_1788237284_3212880686_init();
    xilinxcorelib_a_3290496643_3212880686_init();
    work_a_0707600384_3977288893_init();
    work_a_2227433592_1949178628_init();
    xilinxcorelib_a_1874671172_3212880686_init();
    xilinxcorelib_a_3249956304_3212880686_init();
    xilinxcorelib_a_3341450364_3212880686_init();
    work_a_2020208905_0948729464_init();
    work_a_2913559850_3212880686_init();
    work_a_2111142803_3212880686_init();
    xilinxcorelib_a_0672293330_3212880686_init();
    xilinxcorelib_a_3247166899_3212880686_init();
    work_a_4289548372_0833129884_init();
    work_a_3733755454_3212880686_init();
    work_a_1738412071_3212880686_init();
    work_a_1453213902_2372691052_init();


    xsi_register_tops("work_a_1453213902_2372691052");

    UNISIM_P_0947159679 = xsi_get_engine_memory("unisim_p_0947159679");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_0227793272 = xsi_get_engine_memory("work_p_0227793272");
    XILINXCORELIB_P_1032809427 = xsi_get_engine_memory("xilinxcorelib_p_1032809427");
    XILINXCORELIB_P_2048898517 = xsi_get_engine_memory("xilinxcorelib_p_2048898517");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");
    WORK_P_2110098887 = xsi_get_engine_memory("work_p_2110098887");
    IEEE_P_3972351953 = xsi_get_engine_memory("ieee_p_3972351953");
    WORK_P_0108441146 = xsi_get_engine_memory("work_p_0108441146");
    IEEE_P_1367372525 = xsi_get_engine_memory("ieee_p_1367372525");
    IEEE_P_2717149903 = xsi_get_engine_memory("ieee_p_2717149903");
    UNISIM_P_3222816464 = xsi_get_engine_memory("unisim_p_3222816464");
    XILINXCORELIB_P_1866012138 = xsi_get_engine_memory("xilinxcorelib_p_1866012138");
    XILINXCORELIB_P_0656867652 = xsi_get_engine_memory("xilinxcorelib_p_0656867652");

    return xsi_run_simulation(argc, argv);

}
