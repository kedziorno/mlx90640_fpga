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
extern char *STD_STANDARD;
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_3488546069778340532_2592010699(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_3488768496604610246_2592010699(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_374109322130769762_2592010699(char *, unsigned char );


int xilinxcorelib_a_3249956304_3212880686_sub_10977479924507991001_3212880686(char *t1, int t2)
{
    char t3[120];
    char t4[8];
    char t8[8];
    int t0;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    char *t13;
    char *t14;
    int t15;

LAB0:    t5 = (t3 + 4U);
    t6 = ((STD_STANDARD) + 448);
    t7 = (t5 + 80U);
    *((char **)t7) = t6;
    t9 = (t5 + 48U);
    *((char **)t9) = t8;
    *((int *)t8) = 0;
    t10 = (t5 + 72U);
    *((unsigned int *)t10) = 4U;
    t11 = (t4 + 4U);
    *((int *)t11) = t2;
    t12 = (t2 == 0);
    if (t12 != 0)
        goto LAB2;

LAB4:    t15 = (t2 - 1);
    t6 = (t5 + 48U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((int *)t6) = t15;

LAB3:    t6 = (t5 + 48U);
    t7 = *((char **)t6);
    t15 = *((int *)t7);
    t0 = t15;

LAB1:    return t0;
LAB2:    t13 = (t5 + 48U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((int *)t13) = 0;
    goto LAB3;

LAB5:;
}

unsigned char xilinxcorelib_a_3249956304_3212880686_sub_7454328198754670226_3212880686(char *t1, int t2)
{
    char t3[120];
    char t4[8];
    char t8[8];
    unsigned char t0;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    unsigned char t12;
    char *t13;
    char *t14;

LAB0:    t5 = (t3 + 4U);
    t6 = ((IEEE_P_2592010699) + 3144);
    t7 = (t5 + 80U);
    *((char **)t7) = t6;
    t9 = (t5 + 48U);
    *((char **)t9) = t8;
    xsi_type_set_default_value(t6, t8, 0);
    t10 = (t5 + 72U);
    *((unsigned int *)t10) = 1U;
    t11 = (t4 + 4U);
    *((int *)t11) = t2;
    t12 = (t2 == 0);
    if (t12 != 0)
        goto LAB2;

LAB4:    t6 = (t5 + 48U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    *((unsigned char *)t6) = (unsigned char)3;

LAB3:    t6 = (t5 + 48U);
    t7 = *((char **)t6);
    t12 = *((unsigned char *)t7);
    t0 = t12;

LAB1:    return t0;
LAB2:    t13 = (t5 + 48U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    *((unsigned char *)t13) = (unsigned char)2;
    goto LAB3;

LAB5:;
}

unsigned char xilinxcorelib_a_3249956304_3212880686_sub_7655588055760498039_3212880686(char *t1, char *t2, char *t3)
{
    char t4[120];
    char t5[24];
    char t9[8];
    unsigned char t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    unsigned int t16;
    char *t17;
    unsigned char t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t6 = (t4 + 4U);
    t7 = ((IEEE_P_2592010699) + 3144);
    t8 = (t6 + 80U);
    *((char **)t8) = t7;
    t10 = (t6 + 48U);
    *((char **)t10) = t9;
    xsi_type_set_default_value(t7, t9, 0);
    t11 = (t6 + 72U);
    *((unsigned int *)t11) = 1U;
    t12 = (t5 + 4U);
    t13 = (t2 != 0);
    if (t13 == 1)
        goto LAB3;

LAB2:    t14 = (t5 + 12U);
    *((char **)t14) = t3;
    t15 = (t3 + 12U);
    t16 = *((unsigned int *)t15);
    t16 = (t16 * 1U);
    t17 = (t1 + 10151);
    t19 = 1;
    if (t16 == 7U)
        goto LAB7;

LAB8:    t19 = 0;

LAB9:    if (t19 != 0)
        goto LAB4;

LAB6:    t7 = (t6 + 48U);
    t8 = *((char **)t7);
    t7 = (t8 + 0);
    *((unsigned char *)t7) = (unsigned char)2;

LAB5:    t7 = (t6 + 48U);
    t8 = *((char **)t7);
    t13 = *((unsigned char *)t8);
    t0 = t13;

LAB1:    return t0;
LAB3:    *((char **)t12) = *((char **)t2);
    goto LAB2;

LAB4:    t23 = (t6 + 48U);
    t24 = *((char **)t23);
    t23 = (t24 + 0);
    *((unsigned char *)t23) = (unsigned char)3;
    goto LAB5;

LAB7:    t20 = 0;

LAB10:    if (t20 < t16)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t21 = (t2 + t20);
    t22 = (t17 + t20);
    if (*((unsigned char *)t21) != *((unsigned char *)t22))
        goto LAB8;

LAB12:    t20 = (t20 + 1);
    goto LAB10;

LAB13:;
}

static void xilinxcorelib_a_3249956304_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:
LAB3:    t1 = (t0 + 1696U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4216U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_374109322130769762_2592010699(IEEE_P_2592010699, t5);
    t7 = ieee_p_2592010699_sub_3488546069778340532_2592010699(IEEE_P_2592010699, t3, t6);
    t1 = (t0 + 4664U);
    t8 = *((char **)t1);
    t9 = *((unsigned char *)t8);
    t1 = (t0 + 4552U);
    t10 = *((char **)t1);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_3488768496604610246_2592010699(IEEE_P_2592010699, t9, t11);
    t13 = ieee_p_2592010699_sub_3488546069778340532_2592010699(IEEE_P_2592010699, t7, t12);
    t1 = (t0 + 7112);
    t14 = (t1 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = t13;
    xsi_driver_first_trans_fast(t1);

LAB2:    t18 = (t0 + 6984);
    *((int *)t18) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void xilinxcorelib_a_3249956304_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    unsigned char t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:
LAB3:    t1 = (t0 + 4328U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 1536U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_3488768496604610246_2592010699(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 4328U);
    t7 = *((char **)t1);
    t8 = *((unsigned char *)t7);
    t9 = ieee_p_2592010699_sub_374109322130769762_2592010699(IEEE_P_2592010699, t8);
    t1 = (t0 + 2336U);
    t10 = *((char **)t1);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_3488768496604610246_2592010699(IEEE_P_2592010699, t9, t11);
    t13 = ieee_p_2592010699_sub_3488546069778340532_2592010699(IEEE_P_2592010699, t6, t12);
    t1 = (t0 + 4664U);
    t14 = *((char **)t1);
    t15 = *((unsigned char *)t14);
    t1 = (t0 + 4552U);
    t16 = *((char **)t1);
    t17 = *((unsigned char *)t16);
    t18 = ieee_p_2592010699_sub_3488768496604610246_2592010699(IEEE_P_2592010699, t15, t17);
    t19 = ieee_p_2592010699_sub_3488546069778340532_2592010699(IEEE_P_2592010699, t13, t18);
    t1 = (t0 + 7176);
    t20 = (t1 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    *((unsigned char *)t23) = t19;
    xsi_driver_first_trans_fast(t1);

LAB2:    t24 = (t0 + 7000);
    *((int *)t24) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void xilinxcorelib_a_3249956304_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:
LAB3:    t1 = (t0 + 1376U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4440U);
    t4 = *((char **)t1);
    t5 = *((unsigned char *)t4);
    t6 = ieee_p_2592010699_sub_3488768496604610246_2592010699(IEEE_P_2592010699, t3, t5);
    t1 = (t0 + 7240);
    t7 = (t1 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    *((unsigned char *)t10) = t6;
    xsi_driver_first_trans_fast(t1);

LAB2:    t11 = (t0 + 7016);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void xilinxcorelib_a_3249956304_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:
LAB3:    t1 = (t0 + 1856U);
    t2 = *((char **)t1);
    t1 = (t0 + 7304);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 8U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 7032);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void xilinxcorelib_a_3249956304_3212880686_init()
{
	static char *pe[] = {(void *)xilinxcorelib_a_3249956304_3212880686_p_0,(void *)xilinxcorelib_a_3249956304_3212880686_p_1,(void *)xilinxcorelib_a_3249956304_3212880686_p_2,(void *)xilinxcorelib_a_3249956304_3212880686_p_3};
	static char *se[] = {(void *)xilinxcorelib_a_3249956304_3212880686_sub_10977479924507991001_3212880686,(void *)xilinxcorelib_a_3249956304_3212880686_sub_7454328198754670226_3212880686,(void *)xilinxcorelib_a_3249956304_3212880686_sub_7655588055760498039_3212880686};
	xsi_register_didat("xilinxcorelib_a_3249956304_3212880686", "isim/_tmp/xilinxcorelib/a_3249956304_3212880686.didat");
	xsi_register_executes(pe);
	xsi_register_subprogram_executes(se);
}
