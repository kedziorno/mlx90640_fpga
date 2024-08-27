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
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../ExtractKsTaParameters.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
unsigned char ieee_p_2592010699_sub_2763492388968962707_2592010699(char *, char *, unsigned int , unsigned int );


static void work_a_3980557777_3212880686_p_0(char *t0)
{
    char t9[16];
    char t13[16];
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
    char *t14;
    unsigned int t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    static char *nl0[] = {&&LAB9, &&LAB10, &&LAB11, &&LAB12, &&LAB13, &&LAB14, &&LAB15};

LAB0:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 936U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4528);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 1136U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 3336U);
    t7 = *((char **)t3);
    t3 = (t7 + 0);
    *((unsigned char *)t3) = (unsigned char)0;
    xsi_set_current_line(66, ng0);
    t1 = (t0 + 4608);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB8:    goto LAB6;

LAB9:    xsi_set_current_line(70, ng0);
    t4 = (t0 + 1296U);
    t7 = *((char **)t4);
    t5 = *((unsigned char *)t7);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 4608);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB17:    goto LAB8;

LAB10:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(78, ng0);
    t10 = (60 * 2);
    t11 = (t10 + 0);
    t1 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t9, t11, 12);
    t3 = (t0 + 4672);
    t4 = (t3 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t1, 12U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB8;

LAB11:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    goto LAB8;

LAB12:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)4;
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 7240);
    t4 = (t0 + 1776U);
    t7 = *((char **)t4);
    t8 = ((IEEE_P_2592010699) + 3944);
    t12 = (t13 + 0U);
    t14 = (t12 + 0U);
    *((int *)t14) = 0;
    t14 = (t12 + 4U);
    *((int *)t14) = 0;
    t14 = (t12 + 8U);
    *((int *)t14) = 1;
    t10 = (0 - 0);
    t15 = (t10 * 1);
    t15 = (t15 + 1);
    t14 = (t12 + 12U);
    *((unsigned int *)t14) = t15;
    t14 = (t0 + 7056U);
    t4 = xsi_base_array_concat(t4, t9, t8, (char)97, t1, t13, (char)97, t7, t14, (char)101);
    t16 = (t0 + 4736);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t4, 9U);
    xsi_driver_first_trans_fast(t16);
    goto LAB8;

LAB13:    xsi_set_current_line(82, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)5;
    goto LAB8;

LAB14:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)6;
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 2256U);
    t3 = *((char **)t1);
    t1 = (t0 + 4800);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t12 = *((char **)t8);
    memcpy(t12, t3, 32U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB8;

LAB15:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 3336U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 4864);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB8;

LAB16:    xsi_set_current_line(71, ng0);
    t4 = (t0 + 3336U);
    t8 = *((char **)t4);
    t4 = (t8 + 0);
    *((unsigned char *)t4) = (unsigned char)1;
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 4608);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB17;

}


extern void work_a_3980557777_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3980557777_3212880686_p_0};
	xsi_register_didat("work_a_3980557777_3212880686", "isim/_tmp/work/a_3980557777_3212880686.didat");
	xsi_register_executes(pe);
}
