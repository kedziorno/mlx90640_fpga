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



int work_p_0227793272_sub_16272768235463607937_227793272(char *t1, char *t2, char *t3)
{
    char t4[120];
    char t5[24];
    char t6[16];
    char t27[8];
    int t0;
    int t7;
    char *t8;
    int t9;
    char *t10;
    int t11;
    char *t12;
    int t13;
    int t14;
    char *t15;
    int t16;
    char *t17;
    int t18;
    char *t19;
    int t20;
    char *t21;
    char *t22;
    int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t28;
    char *t29;
    char *t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    int t35;
    int t36;
    int t37;
    int t38;
    int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned char t42;
    int t43;
    int t44;
    int t45;
    char *t46;

LAB0:    t8 = (t3 + 0U);
    t9 = *((int *)t8);
    t10 = (t3 + 4U);
    t11 = *((int *)t10);
    t12 = (t3 + 8U);
    t13 = *((int *)t12);
    if (t9 > t11)
        goto LAB2;

LAB3:    if (t13 == -1)
        goto LAB7;

LAB8:    t7 = t11;

LAB4:    t15 = (t3 + 0U);
    t16 = *((int *)t15);
    t17 = (t3 + 4U);
    t18 = *((int *)t17);
    t19 = (t3 + 8U);
    t20 = *((int *)t19);
    if (t16 > t18)
        goto LAB9;

LAB10:    if (t20 == -1)
        goto LAB14;

LAB15:    t14 = t16;

LAB11:    t21 = (t6 + 0U);
    t22 = (t21 + 0U);
    *((int *)t22) = t7;
    t22 = (t21 + 4U);
    *((int *)t22) = t14;
    t22 = (t21 + 8U);
    *((int *)t22) = -1;
    t23 = (t14 - t7);
    t24 = (t23 * -1);
    t24 = (t24 + 1);
    t22 = (t21 + 12U);
    *((unsigned int *)t22) = t24;
    t22 = (t4 + 4U);
    t25 = ((STD_STANDARD) + 448);
    t26 = (t22 + 80U);
    *((char **)t26) = t25;
    t28 = (t22 + 48U);
    *((char **)t28) = t27;
    xsi_type_set_default_value(t25, t27, 0);
    t29 = (t22 + 72U);
    *((unsigned int *)t29) = 4U;
    t30 = (t5 + 4U);
    t31 = (t2 != 0);
    if (t31 == 1)
        goto LAB17;

LAB16:    t32 = (t5 + 12U);
    *((char **)t32) = t3;
    t33 = (t22 + 48U);
    t34 = *((char **)t33);
    t33 = (t34 + 0);
    *((int *)t33) = 0;
    t8 = (t6 + 0U);
    t9 = *((int *)t8);
    t10 = (t6 + 4U);
    t11 = *((int *)t10);
    t12 = (t6 + 8U);
    t13 = *((int *)t12);
    if (t9 > t11)
        goto LAB22;

LAB23:    if (t13 == -1)
        goto LAB27;

LAB28:    t7 = t9;

LAB24:    t15 = (t6 + 0U);
    t16 = *((int *)t15);
    t17 = (t6 + 4U);
    t18 = *((int *)t17);
    t19 = (t6 + 8U);
    t20 = *((int *)t19);
    if (t16 > t18)
        goto LAB29;

LAB30:    if (t20 == -1)
        goto LAB34;

LAB35:    t14 = t18;

LAB31:    t23 = t14;
    t35 = t7;

LAB18:    if (t23 >= t35)
        goto LAB19;

LAB21:    t8 = (t22 + 48U);
    t10 = *((char **)t8);
    t7 = *((int *)t10);
    t0 = t7;

LAB1:    return t0;
LAB2:    if (t13 == 1)
        goto LAB5;

LAB6:    t7 = t9;
    goto LAB4;

LAB5:    t7 = t11;
    goto LAB4;

LAB7:    t7 = t9;
    goto LAB4;

LAB9:    if (t20 == 1)
        goto LAB12;

LAB13:    t14 = t18;
    goto LAB11;

LAB12:    t14 = t16;
    goto LAB11;

LAB14:    t14 = t18;
    goto LAB11;

LAB17:    *((char **)t30) = *((char **)t2);
    goto LAB16;

LAB19:    t21 = (t2 + 0);
    t25 = (t6 + 0U);
    t36 = *((int *)t25);
    t26 = (t6 + 8U);
    t37 = *((int *)t26);
    t38 = (t23 - t36);
    t24 = (t38 * t37);
    t28 = (t6 + 4U);
    t39 = *((int *)t28);
    xsi_vhdl_check_range_of_index(t36, t39, t37, t23);
    t40 = (1U * t24);
    t41 = (0 + t40);
    t29 = (t21 + t41);
    t31 = *((unsigned char *)t29);
    t42 = (t31 == (unsigned char)3);
    if (t42 != 0)
        goto LAB36;

LAB38:    t8 = (t22 + 48U);
    t10 = *((char **)t8);
    t7 = *((int *)t10);
    t9 = (t7 * 2);
    t8 = (t22 + 48U);
    t12 = *((char **)t8);
    t8 = (t12 + 0);
    *((int *)t8) = t9;

LAB37:
LAB20:    t7 = (t23 + -1);
    t23 = t7;
    goto LAB18;

LAB22:    if (t13 == 1)
        goto LAB25;

LAB26:    t7 = t11;
    goto LAB24;

LAB25:    t7 = t9;
    goto LAB24;

LAB27:    t7 = t11;
    goto LAB24;

LAB29:    if (t20 == 1)
        goto LAB32;

LAB33:    t14 = t16;
    goto LAB31;

LAB32:    t14 = t18;
    goto LAB31;

LAB34:    t14 = t16;
    goto LAB31;

LAB36:    t33 = (t22 + 48U);
    t34 = *((char **)t33);
    t43 = *((int *)t34);
    t44 = (t43 * 2);
    t45 = (t44 + 1);
    t33 = (t22 + 48U);
    t46 = *((char **)t33);
    t33 = (t46 + 0);
    *((int *)t33) = t45;
    goto LAB37;

LAB39:;
}

double work_p_0227793272_sub_18092004317800157667_227793272(char *t1, char *t2, char *t3)
{
    char t4[456];
    char t5[24];
    char t9[8];
    char t12[16];
    char t19[8];
    char t25[8];
    char t31[8];
    char t47[16];
    char t54[16];
    double t0;
    char *t6;
    char *t7;
    char *t8;
    char *t10;
    char *t11;
    char *t13;
    char *t14;
    int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t34;
    unsigned char t35;
    char *t36;
    char *t37;
    char *t38;
    unsigned char t40;
    unsigned int t41;
    char *t42;
    char *t43;
    int t44;
    int t45;
    unsigned int t46;
    int t48;
    unsigned int t49;
    int t50;
    int t51;
    double t52;
    unsigned int t53;
    unsigned int t55;
    double t56;
    double t57;

LAB0:    t6 = (t4 + 4U);
    t7 = ((STD_STANDARD) + 448);
    t8 = (t6 + 80U);
    *((char **)t8) = t7;
    t10 = (t6 + 48U);
    *((char **)t10) = t9;
    xsi_type_set_default_value(t7, t9, 0);
    t11 = (t6 + 72U);
    *((unsigned int *)t11) = 4U;
    t13 = (t12 + 0U);
    t14 = (t13 + 0U);
    *((int *)t14) = 31;
    t14 = (t13 + 4U);
    *((int *)t14) = 0;
    t14 = (t13 + 8U);
    *((int *)t14) = -1;
    t15 = (0 - 31);
    t16 = (t15 * -1);
    t16 = (t16 + 1);
    t14 = (t13 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = (t4 + 116U);
    t17 = ((STD_STANDARD) + 544);
    t18 = (t14 + 80U);
    *((char **)t18) = t17;
    t20 = (t14 + 48U);
    *((char **)t20) = t19;
    xsi_type_set_default_value(t17, t19, 0);
    t21 = (t14 + 72U);
    *((unsigned int *)t21) = 8U;
    t22 = (t4 + 228U);
    t23 = ((STD_STANDARD) + 544);
    t24 = (t22 + 80U);
    *((char **)t24) = t23;
    t26 = (t22 + 48U);
    *((char **)t26) = t25;
    xsi_type_set_default_value(t23, t25, 0);
    t27 = (t22 + 72U);
    *((unsigned int *)t27) = 8U;
    t28 = (t4 + 340U);
    t29 = ((STD_STANDARD) + 448);
    t30 = (t28 + 80U);
    *((char **)t30) = t29;
    t32 = (t28 + 48U);
    *((char **)t32) = t31;
    xsi_type_set_default_value(t29, t31, 0);
    t33 = (t28 + 72U);
    *((unsigned int *)t33) = 4U;
    t34 = (t5 + 4U);
    t35 = (t2 != 0);
    if (t35 == 1)
        goto LAB3;

LAB2:    t36 = (t5 + 12U);
    *((char **)t36) = t3;
    t37 = (t3 + 12U);
    t16 = *((unsigned int *)t37);
    t16 = (t16 * 1U);
    t38 = (t1 + 4348);
    t40 = 1;
    if (t16 == 32U)
        goto LAB7;

LAB8:    t40 = 0;

LAB9:    if (t40 != 0)
        goto LAB4;

LAB6:
LAB5:    t7 = (t3 + 12U);
    t16 = *((unsigned int *)t7);
    t16 = (t16 * 1U);
    t8 = (t1 + 4380);
    t35 = 1;
    if (t16 == 32U)
        goto LAB17;

LAB18:    t35 = 0;

LAB19:    if (t35 != 0)
        goto LAB14;

LAB16:
LAB15:    t7 = (t2 + 0);
    t8 = (t12 + 0U);
    t15 = *((int *)t8);
    t16 = (t15 - 30);
    t10 = (t12 + 4U);
    t44 = *((int *)t10);
    t11 = (t12 + 8U);
    t45 = *((int *)t11);
    xsi_vhdl_check_range_of_slice(t15, t44, t45, 30, 23, -1);
    t41 = (t16 * 1U);
    t46 = (0 + t41);
    t13 = (t7 + t46);
    t17 = (t47 + 0U);
    t18 = (t17 + 0U);
    *((int *)t18) = 30;
    t18 = (t17 + 4U);
    *((int *)t18) = 23;
    t18 = (t17 + 8U);
    *((int *)t18) = -1;
    t48 = (23 - 30);
    t49 = (t48 * -1);
    t49 = (t49 + 1);
    t18 = (t17 + 12U);
    *((unsigned int *)t18) = t49;
    t50 = work_p_0227793272_sub_16272768235463607937_227793272(t1, t13, t47);
    t51 = (t50 - 127);
    t18 = (t28 + 48U);
    t20 = *((char **)t18);
    t18 = (t20 + 0);
    *((int *)t18) = t51;
    t7 = ((STD_STANDARD) + 448);
    t8 = (t28 + 48U);
    t10 = *((char **)t8);
    t15 = *((int *)t10);
    t8 = xsi_int_to_mem(t15);
    t11 = xsi_string_variable_get_image(t47, t7, t8);
    t13 = (t47 + 12U);
    t16 = *((unsigned int *)t13);
    xsi_report(t11, t16, 0);
    t7 = (t28 + 48U);
    t8 = *((char **)t7);
    t15 = *((int *)t8);
    t44 = xsi_vhdl_pow(2, t15);
    t7 = (t22 + 48U);
    t10 = *((char **)t7);
    t7 = (t10 + 0);
    *((double *)t7) = ((double)(t44));
    t7 = ((STD_STANDARD) + 544);
    t8 = (t22 + 48U);
    t10 = *((char **)t8);
    t52 = *((double *)t10);
    t8 = xsi_double_to_mem(t52);
    t11 = xsi_string_variable_get_image(t47, t7, t8);
    t13 = (t47 + 12U);
    t16 = *((unsigned int *)t13);
    xsi_report(t11, t16, 0);
    t7 = (t2 + 0);
    t8 = (t12 + 0U);
    t15 = *((int *)t8);
    t16 = (t15 - 22);
    t10 = (t12 + 4U);
    t44 = *((int *)t10);
    t11 = (t12 + 8U);
    t45 = *((int *)t11);
    xsi_vhdl_check_range_of_slice(t15, t44, t45, 22, 0, -1);
    t41 = (t16 * 1U);
    t46 = (0 + t41);
    t13 = (t7 + t46);
    t48 = (0 - 22);
    t49 = (t48 * -1);
    t49 = (t49 + 1);
    t53 = (1U * t49);
    t18 = ((IEEE_P_2592010699) + 3944);
    t20 = (t54 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 22;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t50 = (0 - 22);
    t55 = (t50 * -1);
    t55 = (t55 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t55;
    t17 = xsi_base_array_concat(t17, t47, t18, (char)99, (unsigned char)3, (char)97, t13, t54, (char)101);
    t51 = work_p_0227793272_sub_16272768235463607937_227793272(t1, t17, t47);
    t21 = (t6 + 48U);
    t23 = *((char **)t21);
    t21 = (t23 + 0);
    *((int *)t21) = t51;
    t7 = ((STD_STANDARD) + 448);
    t8 = (t6 + 48U);
    t10 = *((char **)t8);
    t15 = *((int *)t10);
    t8 = xsi_int_to_mem(t15);
    t11 = xsi_string_variable_get_image(t47, t7, t8);
    t13 = (t47 + 12U);
    t16 = *((unsigned int *)t13);
    xsi_report(t11, t16, 0);
    t7 = (t6 + 48U);
    t8 = *((char **)t7);
    t15 = *((int *)t8);
    t52 = ((((double)(t15))) * 1.192092895507800E-07);
    t7 = (t14 + 48U);
    t10 = *((char **)t7);
    t7 = (t10 + 0);
    *((double *)t7) = t52;
    t7 = ((STD_STANDARD) + 544);
    t8 = (t14 + 48U);
    t10 = *((char **)t8);
    t52 = *((double *)t10);
    t8 = xsi_double_to_mem(t52);
    t11 = xsi_string_variable_get_image(t47, t7, t8);
    t13 = (t47 + 12U);
    t16 = *((unsigned int *)t13);
    xsi_report(t11, t16, 0);
    t7 = (t14 + 48U);
    t8 = *((char **)t7);
    t52 = *((double *)t8);
    t7 = (t22 + 48U);
    t10 = *((char **)t7);
    t56 = *((double *)t10);
    t57 = (t52 * t56);
    t7 = (t14 + 48U);
    t11 = *((char **)t7);
    t7 = (t11 + 0);
    *((double *)t7) = t57;
    t7 = ((STD_STANDARD) + 544);
    t8 = (t14 + 48U);
    t10 = *((char **)t8);
    t52 = *((double *)t10);
    t8 = xsi_double_to_mem(t52);
    t11 = xsi_string_variable_get_image(t47, t7, t8);
    t13 = (t47 + 12U);
    t16 = *((unsigned int *)t13);
    xsi_report(t11, t16, 0);
    t7 = (t2 + 0);
    t8 = (t12 + 0U);
    t15 = *((int *)t8);
    t10 = (t12 + 8U);
    t44 = *((int *)t10);
    t45 = (31 - t15);
    t16 = (t45 * t44);
    t41 = (1U * t16);
    t46 = (0 + t41);
    t11 = (t7 + t46);
    t35 = *((unsigned char *)t11);
    t40 = (t35 == (unsigned char)3);
    if (t40 != 0)
        goto LAB24;

LAB26:    t7 = (t14 + 48U);
    t8 = *((char **)t7);
    t52 = *((double *)t8);
    t0 = t52;

LAB1:    return t0;
LAB3:    *((char **)t34) = *((char **)t2);
    goto LAB2;

LAB4:    t0 = 0.000000000000000;
    goto LAB1;

LAB7:    t41 = 0;

LAB10:    if (t41 < t16)
        goto LAB11;
    else
        goto LAB9;

LAB11:    t42 = (t2 + t41);
    t43 = (t38 + t41);
    if (*((unsigned char *)t42) != *((unsigned char *)t43))
        goto LAB8;

LAB12:    t41 = (t41 + 1);
    goto LAB10;

LAB13:    goto LAB5;

LAB14:    t0 = 0.000000000000000;
    goto LAB1;

LAB17:    t41 = 0;

LAB20:    if (t41 < t16)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t11 = (t2 + t41);
    t13 = (t8 + t41);
    if (*((unsigned char *)t11) != *((unsigned char *)t13))
        goto LAB18;

LAB22:    t41 = (t41 + 1);
    goto LAB20;

LAB23:    goto LAB15;

LAB24:    t13 = (t14 + 48U);
    t17 = *((char **)t13);
    t52 = *((double *)t17);
    t56 = (-(t52));
    t0 = t56;
    goto LAB1;

LAB25:    t0 = 0.000000000000000;
    goto LAB1;

LAB27:    goto LAB25;

LAB28:    goto LAB25;

LAB29:;
}


extern void work_p_0227793272_init()
{
	static char *se[] = {(void *)work_p_0227793272_sub_16272768235463607937_227793272,(void *)work_p_0227793272_sub_18092004317800157667_227793272};
	xsi_register_didat("work_p_0227793272", "isim/_tmp/work/p_0227793272.didat");
	xsi_register_subprogram_executes(se);
}
