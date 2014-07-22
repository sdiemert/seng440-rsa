/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/ggollmer/SENG440/seng440-rsa/vhdl/montgomery_multiplication/montgomery_multiplier.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_3362144882_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1696U);
    t2 = *((char **)t1);
    t1 = (t0 + 4288);
    t3 = (t1 + 32U);
    t4 = *((char **)t3);
    t5 = (t4 + 32U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 64U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 4188);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3362144882_3212880686_p_1(char *t0)
{
    char t41[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned char t23;
    unsigned char t24;
    char *t25;
    char *t26;
    int t27;
    unsigned int t28;
    unsigned int t29;
    unsigned int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned char t38;
    unsigned char t39;
    char *t40;
    char *t42;
    unsigned int t43;
    unsigned char t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;
    char *t49;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 3192U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 1420U);
    t3 = *((char **)t2);
    t4 = (0 - 63);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(55, ng0);

LAB13:    t2 = (t0 + 4196);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(56, ng0);
    t10 = (t0 + 1788U);
    t11 = *((char **)t10);
    t12 = (0 - 63);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t16 = *((unsigned char *)t10);
    t17 = (t0 + 1512U);
    t18 = *((char **)t17);
    t19 = (0 - 63);
    t20 = (t19 * -1);
    t21 = (1U * t20);
    t22 = (0 + t21);
    t17 = (t18 + t22);
    t23 = *((unsigned char *)t17);
    t24 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t16, t23);
    t25 = (t0 + 1788U);
    t26 = *((char **)t25);
    t27 = (0 - 63);
    t28 = (t27 * -1);
    t29 = (1U * t28);
    t30 = (0 + t29);
    t25 = (t26 + t30);
    t31 = *((unsigned char *)t25);
    t32 = (t0 + 1512U);
    t33 = *((char **)t32);
    t34 = (0 - 63);
    t35 = (t34 * -1);
    t36 = (1U * t35);
    t37 = (0 + t36);
    t32 = (t33 + t37);
    t38 = *((unsigned char *)t32);
    t39 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t31, t38);
    t42 = ((IEEE_P_2592010699) + 2312);
    t40 = xsi_base_array_concat(t40, t41, t42, (char)99, t24, (char)99, t39, (char)101);
    t43 = (1U + 1U);
    t44 = (2U != t43);
    if (t44 == 1)
        goto LAB7;

LAB8:    t45 = (t0 + 4324);
    t46 = (t45 + 32U);
    t47 = *((char **)t46);
    t48 = (t47 + 32U);
    t49 = *((char **)t48);
    memcpy(t49, t40, 2U);
    xsi_driver_first_trans_fast(t45);
    goto LAB4;

LAB6:    xsi_set_current_line(56, ng0);
    t2 = (t0 + 1788U);
    t3 = *((char **)t2);
    t4 = (0 - 63);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t10 = ((IEEE_P_2592010699) + 2312);
    t9 = xsi_base_array_concat(t9, t41, t10, (char)99, (unsigned char)2, (char)99, t8, (char)101);
    t13 = (1U + 1U);
    t16 = (2U != t13);
    if (t16 == 1)
        goto LAB9;

LAB10:    t11 = (t0 + 4324);
    t17 = (t11 + 32U);
    t18 = *((char **)t17);
    t25 = (t18 + 32U);
    t26 = *((char **)t25);
    memcpy(t26, t9, 2U);
    xsi_driver_first_trans_fast(t11);
    goto LAB4;

LAB7:    xsi_size_not_matching(2U, t43, 0);
    goto LAB8;

LAB9:    xsi_size_not_matching(2U, t13, 0);
    goto LAB10;

LAB11:    t3 = (t0 + 4196);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3362144882_3212880686_p_2(char *t0)
{
    char t17[16];
    char t19[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    char *t16;
    char *t18;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2340U);
    t3 = *((char **)t2);
    t4 = (1 - 1);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(59, ng0);

LAB11:    t2 = (t0 + 4204);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB12;

LAB1:    return;
LAB5:    xsi_set_current_line(60, ng0);
    t10 = (t0 + 1604U);
    t11 = *((char **)t10);
    t12 = (64 - 2);
    t13 = (63 - t12);
    t14 = (t13 * 1U);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t18 = ((IEEE_P_2592010699) + 2312);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 62;
    t21 = (t20 + 4U);
    *((int *)t21) = 0;
    t21 = (t20 + 8U);
    *((int *)t21) = -1;
    t22 = (0 - 62);
    t23 = (t22 * -1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t16 = xsi_base_array_concat(t16, t17, t18, (char)97, t10, t19, (char)99, (unsigned char)2, (char)101);
    t23 = (63U + 1U);
    t24 = (64U != t23);
    if (t24 == 1)
        goto LAB7;

LAB8:    t21 = (t0 + 4360);
    t25 = (t21 + 32U);
    t26 = *((char **)t25);
    t27 = (t26 + 32U);
    t28 = *((char **)t27);
    memcpy(t28, t16, 64U);
    xsi_driver_first_trans_fast(t21);
    goto LAB4;

LAB6:    xsi_set_current_line(60, ng0);
    t2 = (t0 + 1604U);
    t3 = *((char **)t2);
    t2 = (t0 + 4360);
    t9 = (t2 + 32U);
    t10 = *((char **)t9);
    t11 = (t10 + 32U);
    t16 = *((char **)t11);
    memcpy(t16, t3, 64U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_size_not_matching(64U, t23, 0);
    goto LAB8;

LAB9:    t3 = (t0 + 4204);
    *((int *)t3) = 0;
    goto LAB2;

LAB10:    goto LAB9;

LAB12:    goto LAB10;

}

static void work_a_3362144882_3212880686_p_3(char *t0)
{
    char t10[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    static char *nl0[] = {&&LAB6, &&LAB6, &&LAB6, &&LAB5, &&LAB6, &&LAB6, &&LAB6, &&LAB6, &&LAB6};

LAB0:    t1 = (t0 + 3464U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(63, ng0);
    t2 = (t0 + 1420U);
    t3 = *((char **)t2);
    t4 = (0 - 63);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (char *)((nl0) + t8);
    goto **((char **)t9);

LAB4:    xsi_set_current_line(63, ng0);

LAB11:    t2 = (t0 + 4212);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB12;

LAB1:    return;
LAB5:    xsi_set_current_line(64, ng0);
    t11 = (t0 + 1788U);
    t12 = *((char **)t11);
    t11 = (t0 + 8864U);
    t13 = (t0 + 1512U);
    t14 = *((char **)t13);
    t13 = (t0 + 8848U);
    t15 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t10, t12, t11, t14, t13);
    t16 = (t10 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (64U != t18);
    if (t19 == 1)
        goto LAB7;

LAB8:    t20 = (t0 + 4396);
    t21 = (t20 + 32U);
    t22 = *((char **)t21);
    t23 = (t22 + 32U);
    t24 = *((char **)t23);
    memcpy(t24, t15, 64U);
    xsi_driver_first_trans_fast(t20);
    goto LAB4;

LAB6:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1788U);
    t3 = *((char **)t2);
    t2 = (t0 + 4396);
    t9 = (t2 + 32U);
    t11 = *((char **)t9);
    t12 = (t11 + 32U);
    t13 = *((char **)t12);
    memcpy(t13, t3, 64U);
    xsi_driver_first_trans_fast(t2);
    goto LAB4;

LAB7:    xsi_size_not_matching(64U, t18, 0);
    goto LAB8;

LAB9:    t3 = (t0 + 4212);
    *((int *)t3) = 0;
    goto LAB2;

LAB10:    goto LAB9;

LAB12:    goto LAB10;

}

static void work_a_3362144882_3212880686_p_4(char *t0)
{
    char t12[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    unsigned int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;

LAB0:    t1 = (t0 + 3600U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng0);
    t2 = (t0 + 2340U);
    t3 = *((char **)t2);
    t2 = (t0 + 9746);
    t5 = xsi_mem_cmp(t2, t3, 2U);
    if (t5 == 1)
        goto LAB5;

LAB7:
LAB6:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 1972U);
    t3 = *((char **)t2);
    t2 = (t0 + 8864U);
    t4 = (t0 + 1880U);
    t6 = *((char **)t4);
    t4 = (t0 + 8864U);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t12, t3, t2, t6, t4);
    t8 = (t12 + 12U);
    t13 = *((unsigned int *)t8);
    t14 = (1U * t13);
    t15 = (64U != t14);
    if (t15 == 1)
        goto LAB9;

LAB10:    t9 = (t0 + 4432);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    t16 = (t11 + 32U);
    t17 = *((char **)t16);
    memcpy(t17, t7, 64U);
    xsi_driver_first_trans_fast(t9);

LAB4:    xsi_set_current_line(67, ng0);

LAB13:    t2 = (t0 + 4220);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB14;

LAB1:    return;
LAB5:    xsi_set_current_line(68, ng0);
    t6 = (t0 + 1972U);
    t7 = *((char **)t6);
    t6 = (t0 + 4432);
    t8 = (t6 + 32U);
    t9 = *((char **)t8);
    t10 = (t9 + 32U);
    t11 = *((char **)t10);
    memcpy(t11, t7, 64U);
    xsi_driver_first_trans_fast(t6);
    goto LAB4;

LAB8:;
LAB9:    xsi_size_not_matching(64U, t14, 0);
    goto LAB10;

LAB11:    t3 = (t0 + 4220);
    *((int *)t3) = 0;
    goto LAB2;

LAB12:    goto LAB11;

LAB14:    goto LAB12;

}

static void work_a_3362144882_3212880686_p_5(char *t0)
{
    char t8[16];
    char t10[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t9;
    char *t11;
    char *t12;
    int t13;
    unsigned int t14;
    unsigned char t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(71, ng0);

LAB3:    t1 = (t0 + 2064U);
    t2 = *((char **)t1);
    t3 = (64 - 1);
    t4 = (63 - t3);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t9 = ((IEEE_P_2592010699) + 2312);
    t11 = (t10 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 63;
    t12 = (t11 + 4U);
    *((int *)t12) = 1;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t13 = (1 - 63);
    t14 = (t13 * -1);
    t14 = (t14 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t14;
    t7 = xsi_base_array_concat(t7, t8, t9, (char)99, (unsigned char)2, (char)97, t1, t10, (char)101);
    t14 = (1U + 63U);
    t15 = (64U != t14);
    if (t15 == 1)
        goto LAB5;

LAB6:    t12 = (t0 + 4468);
    t16 = (t12 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 32U);
    t19 = *((char **)t18);
    memcpy(t19, t7, 64U);
    xsi_driver_first_trans_fast(t12);

LAB2:    t20 = (t0 + 4228);
    *((int *)t20) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(64U, t14, 0);
    goto LAB6;

}

static void work_a_3362144882_3212880686_p_6(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(73, ng0);

LAB3:    t1 = (t0 + 1328U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 4504);
    t4 = (t1 + 32U);
    t5 = *((char **)t4);
    t6 = (t5 + 32U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = t3;
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t8 = (t0 + 4236);
    *((int *)t8) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3362144882_3212880686_p_7(char *t0)
{
    char t24[16];
    char t28[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned int t19;
    int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    int t25;
    unsigned int t26;
    char *t27;
    char *t29;

LAB0:    xsi_set_current_line(77, ng0);
    t2 = (t0 + 568U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    t2 = (t0 + 4244);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(78, ng0);
    t4 = (t0 + 1328U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 2248U);
    t4 = *((char **)t2);
    t20 = (64 - 1);
    t19 = (63 - t20);
    t21 = (t19 * 1U);
    t22 = (0 + t21);
    t2 = (t4 + t22);
    t8 = ((IEEE_P_2592010699) + 2312);
    t11 = (t28 + 0U);
    t14 = (t11 + 0U);
    *((int *)t14) = 63;
    t14 = (t11 + 4U);
    *((int *)t14) = 1;
    t14 = (t11 + 8U);
    *((int *)t14) = -1;
    t25 = (1 - 63);
    t23 = (t25 * -1);
    t23 = (t23 + 1);
    t14 = (t11 + 12U);
    *((unsigned int *)t14) = t23;
    t5 = xsi_base_array_concat(t5, t24, t8, (char)99, (unsigned char)2, (char)97, t2, t28, (char)101);
    t23 = (1U + 63U);
    t1 = (64U != t23);
    if (t1 == 1)
        goto LAB20;

LAB21:    t14 = (t0 + 4648);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 64U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1420U);
    t4 = *((char **)t2);
    t20 = (64 - 1);
    t19 = (63 - t20);
    t21 = (t19 * 1U);
    t22 = (0 + t21);
    t2 = (t4 + t22);
    t8 = ((IEEE_P_2592010699) + 2312);
    t11 = (t28 + 0U);
    t14 = (t11 + 0U);
    *((int *)t14) = 63;
    t14 = (t11 + 4U);
    *((int *)t14) = 1;
    t14 = (t11 + 8U);
    *((int *)t14) = -1;
    t25 = (1 - 63);
    t23 = (t25 * -1);
    t23 = (t23 + 1);
    t14 = (t11 + 12U);
    *((unsigned int *)t14) = t23;
    t5 = xsi_base_array_concat(t5, t24, t8, (char)99, (unsigned char)2, (char)97, t2, t28, (char)101);
    t23 = (1U + 63U);
    t1 = (64U != t23);
    if (t1 == 1)
        goto LAB22;

LAB23:    t14 = (t0 + 4540);
    t15 = (t14 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    memcpy(t18, t5, 64U);
    xsi_driver_first_trans_fast(t14);
    xsi_set_current_line(92, ng0);
    t2 = (t0 + 2156U);
    t4 = *((char **)t2);
    t2 = (t0 + 4684);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t11 = (t8 + 32U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 64U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(93, ng0);
    t2 = (t0 + 2248U);
    t4 = *((char **)t2);
    t2 = (t0 + 8864U);
    t5 = xsi_get_transient_memory(64U);
    memset(t5, 0, 64U);
    t8 = t5;
    if (-1 == -1)
        goto LAB27;

LAB28:    t19 = 0;

LAB29:    t20 = (t19 - 63);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t11 = (t8 + t22);
    t23 = (1U * 64U);
    memset(t11, (unsigned char)2, t23);
    t14 = (t24 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 63;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t25 = (63 - 0);
    t26 = (t25 * 1);
    t26 = (t26 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t26;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t24);
    if (t1 != 0)
        goto LAB24;

LAB26:
LAB25:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 592U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(79, ng0);
    t4 = (t0 + 776U);
    t11 = *((char **)t4);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 != 0)
        goto LAB11;

LAB13:
LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(80, ng0);
    t4 = (t0 + 960U);
    t14 = *((char **)t4);
    t4 = (t0 + 4540);
    t15 = (t4 + 32U);
    t16 = *((char **)t15);
    t17 = (t16 + 32U);
    t18 = *((char **)t17);
    memcpy(t18, t14, 64U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1052U);
    t4 = *((char **)t2);
    t2 = (t0 + 4576);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t11 = (t8 + 32U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 64U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(82, ng0);
    t2 = (t0 + 1144U);
    t4 = *((char **)t2);
    t2 = (t0 + 4612);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t11 = (t8 + 32U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 64U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 1144U);
    t4 = *((char **)t2);
    t2 = (t0 + 4648);
    t5 = (t2 + 32U);
    t8 = *((char **)t5);
    t11 = (t8 + 32U);
    t14 = *((char **)t11);
    memcpy(t14, t4, 64U);
    xsi_driver_first_trans_fast(t2);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 9748);
    t5 = (t0 + 4684);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    t14 = (t11 + 32U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 64U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1144U);
    t4 = *((char **)t2);
    t2 = (t0 + 8816U);
    t5 = xsi_get_transient_memory(64U);
    memset(t5, 0, 64U);
    t8 = t5;
    if (-1 == -1)
        goto LAB17;

LAB18:    t19 = 0;

LAB19:    t20 = (t19 - 63);
    t21 = (t20 * -1);
    t22 = (1U * t21);
    t11 = (t8 + t22);
    t23 = (1U * 64U);
    memset(t11, (unsigned char)2, t23);
    t14 = (t24 + 0U);
    t15 = (t14 + 0U);
    *((int *)t15) = 0;
    t15 = (t14 + 4U);
    *((int *)t15) = 63;
    t15 = (t14 + 8U);
    *((int *)t15) = 1;
    t25 = (63 - 0);
    t26 = (t25 * 1);
    t26 = (t26 + 1);
    t15 = (t14 + 12U);
    *((unsigned int *)t15) = t26;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t24);
    t3 = (!(t1));
    if (t3 != 0)
        goto LAB14;

LAB16:
LAB15:    goto LAB12;

LAB14:    xsi_set_current_line(86, ng0);
    t15 = (t0 + 4720);
    t16 = (t15 + 32U);
    t17 = *((char **)t16);
    t18 = (t17 + 32U);
    t27 = *((char **)t18);
    *((unsigned char *)t27) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);
    goto LAB15;

LAB17:    t19 = 63;
    goto LAB19;

LAB20:    xsi_size_not_matching(64U, t23, 0);
    goto LAB21;

LAB22:    xsi_size_not_matching(64U, t23, 0);
    goto LAB23;

LAB24:    xsi_set_current_line(94, ng0);
    t15 = (t0 + 1788U);
    t16 = *((char **)t15);
    t15 = (t0 + 4756);
    t17 = (t15 + 32U);
    t18 = *((char **)t17);
    t27 = (t18 + 32U);
    t29 = *((char **)t27);
    memcpy(t29, t16, 64U);
    xsi_driver_first_trans_fast(t15);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 4720);
    t4 = (t2 + 32U);
    t5 = *((char **)t4);
    t8 = (t5 + 32U);
    t11 = *((char **)t8);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_fast(t2);
    goto LAB25;

LAB27:    t19 = 63;
    goto LAB29;

}


extern void work_a_3362144882_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3362144882_3212880686_p_0,(void *)work_a_3362144882_3212880686_p_1,(void *)work_a_3362144882_3212880686_p_2,(void *)work_a_3362144882_3212880686_p_3,(void *)work_a_3362144882_3212880686_p_4,(void *)work_a_3362144882_3212880686_p_5,(void *)work_a_3362144882_3212880686_p_6,(void *)work_a_3362144882_3212880686_p_7};
	xsi_register_didat("work_a_3362144882_3212880686", "isim/montgomery_multiplier_TB_isim_beh.exe.sim/work/a_3362144882_3212880686.didat");
	xsi_register_executes(pe);
}
