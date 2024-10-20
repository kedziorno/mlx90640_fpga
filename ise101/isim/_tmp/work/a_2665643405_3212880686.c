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
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../ExtractAlphaPtatParameter.vhd";
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
int ieee_p_1242562249_sub_16922599068735143695_1242562249(char *, char *, char *);


static void work_a_2665643405_3212880686_p_0(char *t0)
{
    char t1[16];
    char t10[16];
    char t12[16];
    char t17[16];
    char *t2;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    char *t9;
    char *t11;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    char *t18;
    int t19;
    int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 6303);
    t4 = (t0 + 1296U);
    t5 = *((char **)t4);
    t6 = (15 - 15);
    t7 = (t6 * 1U);
    t8 = (0 + t7);
    t4 = (t5 + t8);
    t11 = ((IEEE_P_2592010699) + 3944);
    t13 = (t12 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 0;
    t14 = (t13 + 4U);
    *((int *)t14) = 11;
    t14 = (t13 + 8U);
    *((int *)t14) = 1;
    t15 = (11 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = (t17 + 0U);
    t18 = (t14 + 0U);
    *((int *)t18) = 15;
    t18 = (t14 + 4U);
    *((int *)t18) = 12;
    t18 = (t14 + 8U);
    *((int *)t18) = -1;
    t19 = (12 - 15);
    t16 = (t19 * -1);
    t16 = (t16 + 1);
    t18 = (t14 + 12U);
    *((unsigned int *)t18) = t16;
    t9 = xsi_base_array_concat(t9, t10, t11, (char)97, t2, t12, (char)97, t4, t17, (char)101);
    t20 = ieee_p_1242562249_sub_16922599068735143695_1242562249(IEEE_P_1242562249, t9, t10);
    t18 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t1, t20, 9);
    t21 = (t0 + 4088);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t18, 9U);
    xsi_driver_first_trans_fast(t21);
    t2 = (t0 + 3992);
    *((int *)t2) = 1;

LAB1:    return;
}

static void work_a_2665643405_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1616U);
    t2 = *((char **)t1);
    t1 = (t0 + 4152);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4008);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_2665643405_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2665643405_3212880686_p_0,(void *)work_a_2665643405_3212880686_p_1};
	xsi_register_didat("work_a_2665643405_3212880686", "isim/_tmp/work/a_2665643405_3212880686.didat");
	xsi_register_executes(pe);
}
