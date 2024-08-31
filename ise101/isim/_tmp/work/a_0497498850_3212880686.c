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

/* This file is designed for use with ISim build 0xabfbedd0 */

#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../ExtractVDDParameters.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_2592010699(char *, char *, unsigned int , unsigned int );


static void work_a_0497498850_3212880686_p_0(char *t0)
{
    char t9[16];
    char t16[16];
    char t20[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t10;
    int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t17;
    char *t18;
    unsigned int t19;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15, &&LAB16, &&LAB17};

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 936U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5760);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t3 = (t0 + 1136U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(62, ng0);
    t3 = (t0 + 4568U);
    t7 = *((char **)t3);
    t3 = (t7 + 0);
    *((unsigned char *)t3) = (unsigned char)0;
    xsi_set_current_line(63, ng0);
    t1 = (t0 + 5840);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 5904);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB8:    goto LAB6;

LAB9:    xsi_set_current_line(68, ng0);
    t4 = (t0 + 1296U);
    t7 = *((char **)t4);
    t5 = *((unsigned char *)t7);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB18;

LAB20:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5840);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB19:    goto LAB8;

LAB10:    xsi_set_current_line(75, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(76, ng0);
    t10 = (51 * 2);
    t11 = (t10 + 0);
    t1 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t9, t11, 12);
    t3 = (t0 + 5968);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t1, 12U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB8;

LAB11:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(78, ng0);
    t10 = (51 * 2);
    t11 = (t10 + 1);
    t1 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t9, t11, 12);
    t3 = (t0 + 5968);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t1, 12U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB8;

LAB12:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)4;
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 1776U);
    t3 = *((char **)t1);
    t1 = (t0 + 4456U);
    t4 = *((char **)t1);
    t13 = (15 - 15);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t4 + t15);
    memcpy(t1, t3, 8U);
    goto LAB8;

LAB13:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)5;
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1776U);
    t3 = *((char **)t1);
    t1 = (t0 + 4456U);
    t4 = *((char **)t1);
    t13 = (15 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t1 = (t4 + t15);
    memcpy(t1, t3, 8U);
    goto LAB8;

LAB14:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)6;
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 9143);
    t4 = (t0 + 4456U);
    t7 = *((char **)t4);
    t13 = (15 - 15);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t4 = (t7 + t15);
    t12 = ((IEEE_P_2592010699) + 3944);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t10 = (0 - 0);
    t19 = (t10 * 1);
    t19 = (t19 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t19;
    t18 = (t20 + 0U);
    t21 = (t18 + 0U);
    *((int *)t21) = 15;
    t21 = (t18 + 4U);
    *((int *)t21) = 8;
    t21 = (t18 + 8U);
    *((int *)t21) = -1;
    t11 = (8 - 15);
    t19 = (t11 * -1);
    t19 = (t19 + 1);
    t21 = (t18 + 12U);
    *((unsigned int *)t21) = t19;
    t8 = xsi_base_array_concat(t8, t9, t12, (char)97, t1, t16, (char)97, t4, t20, (char)101);
    t21 = (t0 + 6032);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t8, 9U);
    xsi_driver_first_trans_fast(t21);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 9144);
    t4 = (t0 + 4456U);
    t7 = *((char **)t4);
    t13 = (15 - 7);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t4 = (t7 + t15);
    t12 = ((IEEE_P_2592010699) + 3944);
    t17 = (t16 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 0;
    t18 = (t17 + 4U);
    *((int *)t18) = 0;
    t18 = (t17 + 8U);
    *((int *)t18) = 1;
    t10 = (0 - 0);
    t19 = (t10 * 1);
    t19 = (t19 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t19;
    t18 = (t20 + 0U);
    t21 = (t18 + 0U);
    *((int *)t21) = 7;
    t21 = (t18 + 4U);
    *((int *)t21) = 0;
    t21 = (t18 + 8U);
    *((int *)t21) = -1;
    t11 = (0 - 7);
    t19 = (t11 * -1);
    t19 = (t19 + 1);
    t21 = (t18 + 12U);
    *((unsigned int *)t21) = t19;
    t8 = xsi_base_array_concat(t8, t9, t12, (char)97, t1, t16, (char)97, t4, t20, (char)101);
    t21 = (t0 + 6096);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t8, 9U);
    xsi_driver_first_trans_fast(t21);
    goto LAB8;

LAB15:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)7;
    goto LAB8;

LAB16:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)8;
    xsi_set_current_line(88, ng0);
    t1 = (t0 + 2416U);
    t3 = *((char **)t1);
    t1 = (t0 + 6160);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 2576U);
    t3 = *((char **)t1);
    t1 = (t0 + 6224);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB8;

LAB17:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 4568U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 5904);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB8;

LAB18:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 4568U);
    t8 = *((char **)t4);
    t4 = (t8 + 0);
    *((unsigned char *)t4) = (unsigned char)1;
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 5840);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB19;

}


extern void work_a_0497498850_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0497498850_3212880686_p_0};
	xsi_register_didat("work_a_0497498850_3212880686", "isim/_tmp/work/a_0497498850_3212880686.didat");
	xsi_register_executes(pe);
}
