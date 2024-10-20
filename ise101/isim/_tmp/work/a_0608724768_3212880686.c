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
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../mem_switchpattern.vhd";
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
int ieee_p_1242562249_sub_16922599068735143695_1242562249(char *, char *, char *);


static void work_a_0608724768_3212880686_p_0(char *t0)
{
    char t1[16];
    char t4[16];
    char *t2;
    char *t3;
    char *t5;
    int t6;
    unsigned int t7;
    int t8;
    int t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(50, ng0);
    t2 = (t0 + 1296U);
    t3 = *((char **)t2);
    t2 = (t4 + 0U);
    t5 = (t2 + 0U);
    *((int *)t5) = 13;
    t5 = (t2 + 4U);
    *((int *)t5) = 0;
    t5 = (t2 + 8U);
    *((int *)t5) = -1;
    t6 = (0 - 13);
    t7 = (t6 * -1);
    t7 = (t7 + 1);
    t5 = (t2 + 12U);
    *((unsigned int *)t5) = t7;
    t8 = ieee_p_1242562249_sub_16922599068735143695_1242562249(IEEE_P_1242562249, t3, t4);
    t9 = (t8 - 1);
    t10 = (t9 * 4);
    t5 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t1, t10, 14);
    t11 = (t0 + 3928);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t5, 14U);
    xsi_driver_first_trans_fast(t11);
    t2 = (t0 + 3832);
    *((int *)t2) = 1;

LAB1:    return;
}

static void work_a_0608724768_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1616U);
    t2 = *((char **)t1);
    t3 = (0 - 0);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t0 + 3992);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    *((unsigned char *)t12) = t7;
    xsi_driver_first_trans_fast_port(t8);

LAB2:    t13 = (t0 + 3848);
    *((int *)t13) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_0608724768_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0608724768_3212880686_p_0,(void *)work_a_0608724768_3212880686_p_1};
	xsi_register_didat("work_a_0608724768_3212880686", "isim/_tmp/work/a_0608724768_3212880686.didat");
	xsi_register_executes(pe);
}
