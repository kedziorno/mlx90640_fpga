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
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../ExtractKtPTATParameter.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
int ieee_p_1242562249_sub_16922599068735143695_1242562249(char *, char *, char *);


static void work_a_0197487621_3212880686_p_0(char *t0)
{
    char t1[16];
    char t7[16];
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(213, ng0);
    t2 = (t0 + 1296U);
    t3 = *((char **)t2);
    t4 = (15 - 9);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t8 = (t7 + 0U);
    t9 = (t8 + 0U);
    *((int *)t9) = 9;
    t9 = (t8 + 4U);
    *((int *)t9) = 0;
    t9 = (t8 + 8U);
    *((int *)t9) = -1;
    t10 = (0 - 9);
    t11 = (t10 * -1);
    t11 = (t11 + 1);
    t9 = (t8 + 12U);
    *((unsigned int *)t9) = t11;
    t12 = ieee_p_1242562249_sub_16922599068735143695_1242562249(IEEE_P_1242562249, t2, t7);
    t9 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t1, t12, 10);
    t13 = (t0 + 4088);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t9, 10U);
    xsi_driver_first_trans_fast(t13);
    t2 = (t0 + 3992);
    *((int *)t2) = 1;

LAB1:    return;
}

static void work_a_0197487621_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(216, ng0);

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


extern void work_a_0197487621_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0197487621_3212880686_p_0,(void *)work_a_0197487621_3212880686_p_1};
	xsi_register_didat("work_a_0197487621_3212880686", "isim/_tmp/work/a_0197487621_3212880686.didat");
	xsi_register_executes(pe);
}
