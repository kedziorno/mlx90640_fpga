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
static const char *ng0 = "/home/ise/workspace/mlx90640_fpga/ise101/../address_generator.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_10420449594411817395_1242562249(char *, char *, int , int );
int ieee_p_1242562249_sub_16922599068735143695_1242562249(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_2763492388968962707_2592010699(char *, char *, unsigned int , unsigned int );
char *ieee_p_3620187407_sub_17391254806193599191_3620187407(char *, char *, char *, char *, int );
unsigned char ieee_p_3620187407_sub_3524899306797260726_3620187407(char *, char *, char *, int );


static void work_a_2913559850_3212880686_p_0(char *t0)
{
    char t15[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;

LAB0:    xsi_set_current_line(41, ng0);
    t1 = (t0 + 1096U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5288);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(42, ng0);
    t3 = (t0 + 976U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(45, ng0);
    t1 = (t0 + 1456U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)3);
    if (t5 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(52, ng0);
    t1 = (t0 + 2096U);
    t3 = *((char **)t1);
    t1 = (t0 + 5384);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 10U);
    xsi_driver_first_trans_fast(t1);

LAB9:    xsi_set_current_line(54, ng0);
    t1 = (t0 + 1616U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB14;

LAB16:
LAB15:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(43, ng0);
    t3 = xsi_get_transient_memory(10U);
    memset(t3, 0, 10U);
    t7 = t3;
    memset(t7, (unsigned char)2, 10U);
    t8 = (t0 + 5384);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t3, 10U);
    xsi_driver_first_trans_fast(t8);
    goto LAB6;

LAB8:    xsi_set_current_line(46, ng0);
    t1 = (t0 + 2096U);
    t4 = *((char **)t1);
    t1 = (t0 + 8072U);
    t13 = (768 - 1);
    t6 = ieee_p_3620187407_sub_3524899306797260726_3620187407(IEEE_P_3620187407, t4, t1, t13);
    if (t6 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 2096U);
    t3 = *((char **)t1);
    t1 = (t0 + 8072U);
    t4 = ieee_p_3620187407_sub_17391254806193599191_3620187407(IEEE_P_3620187407, t15, t3, t1, 1);
    t7 = (t0 + 5384);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 10U);
    xsi_driver_first_trans_fast(t7);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(47, ng0);
    t7 = xsi_get_transient_memory(10U);
    memset(t7, 0, 10U);
    t8 = t7;
    memset(t8, (unsigned char)2, 10U);
    t9 = (t0 + 5384);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t7, 10U);
    xsi_driver_first_trans_fast(t9);
    goto LAB12;

LAB14:    xsi_set_current_line(55, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t4 = t1;
    memset(t4, (unsigned char)2, 10U);
    t7 = (t0 + 5384);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t1, 10U);
    xsi_driver_first_trans_fast(t7);
    goto LAB15;

}

static void work_a_2913559850_3212880686_p_1(char *t0)
{
    char t17[16];
    char t18[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    unsigned char t14;
    unsigned char t15;
    unsigned char t16;
    int t19;
    unsigned int t20;
    int t21;
    int t22;
    int t23;
    int t24;
    static char *nl0[] = {&&LAB9, &&LAB14, &&LAB10, &&LAB14, &&LAB12, &&LAB14, &&LAB13, &&LAB14, &&LAB14, &&LAB14, &&LAB11, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14, &&LAB14};

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1256U);
    t2 = ieee_p_2592010699_sub_2763492388968962707_2592010699(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5304);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t3 = (t0 + 976U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 1456U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (t0 + 5512);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    *((unsigned char *)t9) = t2;
    xsi_driver_first_trans_fast(t1);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t1 = (char *)((nl0) + t2);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(79, ng0);
    t3 = xsi_get_transient_memory(10U);
    memset(t3, 0, 10U);
    t7 = t3;
    memset(t7, (unsigned char)2, 10U);
    t8 = (t0 + 2760U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    memcpy(t8, t3, 10U);
    xsi_set_current_line(80, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 3096U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(82, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t3 = t1;
    memset(t3, (unsigned char)2, 10U);
    t4 = (t0 + 5448);
    t7 = (t4 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 10U);
    xsi_driver_first_trans_fast_port(t4);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 3656U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;

LAB6:    xsi_set_current_line(156, ng0);
    t1 = (t0 + 1616U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = (t2 == (unsigned char)2);
    if (t5 != 0)
        goto LAB36;

LAB38:
LAB37:    goto LAB3;

LAB8:    xsi_set_current_line(152, ng0);
    t1 = (t0 + 2872U);
    t3 = *((char **)t1);
    t1 = (t0 + 5448);
    t4 = (t1 + 56U);
    t7 = *((char **)t4);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t3, 10U);
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB9:    xsi_set_current_line(92, ng0);
    t4 = (t0 + 2256U);
    t7 = *((char **)t4);
    t11 = *((unsigned char *)t7);
    t12 = (t11 == (unsigned char)2);
    if (t12 == 1)
        goto LAB21;

LAB22:    t6 = (unsigned char)0;

LAB23:    if (t6 == 1)
        goto LAB18;

LAB19:    t5 = (unsigned char)0;

LAB20:    if (t5 != 0)
        goto LAB15;

LAB17:    xsi_set_current_line(101, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;

LAB16:    xsi_set_current_line(103, ng0);
    t1 = (t0 + 2096U);
    t3 = *((char **)t1);
    t1 = (t0 + 2872U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    memcpy(t1, t3, 10U);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 2872U);
    t3 = *((char **)t1);
    t1 = (t18 + 0U);
    t4 = (t1 + 0U);
    *((int *)t4) = 9;
    t4 = (t1 + 4U);
    *((int *)t4) = 0;
    t4 = (t1 + 8U);
    *((int *)t4) = -1;
    t19 = (0 - 9);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t4 = (t1 + 12U);
    *((unsigned int *)t4) = t20;
    t21 = ieee_p_1242562249_sub_16922599068735143695_1242562249(IEEE_P_1242562249, t3, t18);
    t22 = (9 + 1);
    t4 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t17, t21, t22);
    t7 = (t0 + 2760U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    t9 = (t17 + 12U);
    t20 = *((unsigned int *)t9);
    t20 = (t20 * 1U);
    memcpy(t7, t4, t20);
    goto LAB8;

LAB10:    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2760U);
    t3 = *((char **)t1);
    t1 = (t18 + 0U);
    t4 = (t1 + 0U);
    *((int *)t4) = 9;
    t4 = (t1 + 4U);
    *((int *)t4) = 0;
    t4 = (t1 + 8U);
    *((int *)t4) = -1;
    t19 = (0 - 9);
    t20 = (t19 * -1);
    t20 = (t20 + 1);
    t4 = (t1 + 12U);
    *((unsigned int *)t4) = t20;
    t21 = ieee_p_1242562249_sub_16922599068735143695_1242562249(IEEE_P_1242562249, t3, t18);
    t4 = (t0 + 3096U);
    t7 = *((char **)t4);
    t22 = *((int *)t7);
    t23 = (t21 + t22);
    t24 = (9 + 1);
    t4 = ieee_p_1242562249_sub_10420449594411817395_1242562249(IEEE_P_1242562249, t17, t23, t24);
    t8 = (t0 + 2872U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t10 = (t17 + 12U);
    t20 = *((unsigned int *)t10);
    t20 = (t20 * 1U);
    memcpy(t8, t4, t20);
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 3880U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t1 = (t0 + 3768U);
    t4 = *((char **)t1);
    t21 = *((int *)t4);
    t22 = (t21 - 1);
    t2 = (t19 == t22);
    if (t2 != 0)
        goto LAB24;

LAB26:    xsi_set_current_line(123, ng0);
    t1 = (t0 + 3880U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t21 = (t19 + 1);
    t1 = (t0 + 3880U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t21;
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;

LAB25:    goto LAB8;

LAB11:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 3096U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t1 = (t0 + 2984U);
    t4 = *((char **)t1);
    t21 = *((int *)t4);
    t22 = (t21 - 1);
    t2 = (t19 == t22);
    if (t2 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(132, ng0);
    t1 = (t0 + 3096U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t21 = (t19 + 1);
    t1 = (t0 + 3096U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t21;

LAB28:    goto LAB8;

LAB12:    xsi_set_current_line(135, ng0);
    t1 = (t0 + 3656U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t1 = (t0 + 3544U);
    t4 = *((char **)t1);
    t21 = *((int *)t4);
    t22 = (t21 - 1);
    t2 = (t19 == t22);
    if (t2 != 0)
        goto LAB30;

LAB32:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 3656U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t21 = (t19 + 1);
    t1 = (t0 + 3656U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t21;
    xsi_set_current_line(140, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)4;

LAB31:    goto LAB8;

LAB13:    xsi_set_current_line(143, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t1 = (t0 + 3320U);
    t4 = *((char **)t1);
    t21 = *((int *)t4);
    t22 = (t21 - 1);
    t2 = (t19 == t22);
    if (t2 != 0)
        goto LAB33;

LAB35:    xsi_set_current_line(147, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t19 = *((int *)t3);
    t21 = (t19 + 1);
    t1 = (t0 + 3432U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((int *)t1) = t21;
    xsi_set_current_line(148, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)2;

LAB34:    goto LAB8;

LAB14:    xsi_set_current_line(150, ng0);
    goto LAB8;

LAB15:    xsi_set_current_line(95, ng0);
    t4 = (t0 + 3208U);
    t10 = *((char **)t4);
    t4 = (t10 + 0);
    *((unsigned char *)t4) = (unsigned char)2;
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 3096U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 3432U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 3656U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    goto LAB16;

LAB18:    t4 = (t0 + 1776U);
    t9 = *((char **)t4);
    t15 = *((unsigned char *)t9);
    t16 = (t15 == (unsigned char)3);
    t5 = t16;
    goto LAB20;

LAB21:    t4 = (t0 + 1456U);
    t8 = *((char **)t4);
    t13 = *((unsigned char *)t8);
    t14 = (t13 == (unsigned char)3);
    t6 = t14;
    goto LAB23;

LAB24:    xsi_set_current_line(120, ng0);
    t1 = (t0 + 3880U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(121, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)10;
    goto LAB25;

LAB27:    xsi_set_current_line(128, ng0);
    t1 = (t0 + 3208U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((unsigned char *)t1) = (unsigned char)4;
    xsi_set_current_line(129, ng0);
    t1 = (t0 + 3096U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((int *)t1) = 0;
    goto LAB28;

LAB30:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3656U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(137, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)6;
    goto LAB31;

LAB33:    xsi_set_current_line(144, ng0);
    t1 = (t0 + 3432U);
    t7 = *((char **)t1);
    t1 = (t7 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(145, ng0);
    t1 = (t0 + 3208U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    goto LAB34;

LAB36:    xsi_set_current_line(157, ng0);
    t1 = (t0 + 3208U);
    t4 = *((char **)t1);
    t1 = (t4 + 0);
    *((unsigned char *)t1) = (unsigned char)0;
    xsi_set_current_line(158, ng0);
    t1 = xsi_get_transient_memory(10U);
    memset(t1, 0, 10U);
    t3 = t1;
    memset(t3, (unsigned char)2, 10U);
    t4 = (t0 + 2872U);
    t7 = *((char **)t4);
    t4 = (t7 + 0);
    memcpy(t4, t1, 10U);
    goto LAB37;

}


extern void work_a_2913559850_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2913559850_3212880686_p_0,(void *)work_a_2913559850_3212880686_p_1};
	xsi_register_didat("work_a_2913559850_3212880686", "isim/_tmp/work/a_2913559850_3212880686.didat");
	xsi_register_executes(pe);
}
