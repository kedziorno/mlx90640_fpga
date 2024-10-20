#include <stdio.h>
#include <stdlib.h>
#include <gmp.h>
#include <mpfr.h>

#include <stdio.h>
#include <stdint.h>
#include <inttypes.h>
#include <math.h>

#define LIST x, y, d, u, e, z


union u_double
{
    double  dbl;
    char    data[sizeof(double)];
};

union u_float
{
    float   flt;
    char    data[sizeof(float)];
};

static void dump_float(union u_float f)
{
    int exp;
    long mant;

    printf("32-bit float: sign: %d, ", (f.data[0] & 0x80) >> 7);
    exp = ((f.data[0] & 0x7F) << 1) | ((f.data[1] & 0x80) >> 7);
    printf("expt: %4d (unbiassed %5d), ", exp, exp - 127);
    mant = ((((f.data[1] & 0x7F) << 8) | (f.data[2] & 0xFF)) << 8) | (f.data[3] & 0xFF);
    printf("mant: %16ld (0x%06lX)\n", mant, mant);
}

static void dump_double(union u_double d)
{
    int exp;
    long long mant;

    printf("64-bit float: sign: %d, ", (d.data[0] & 0x80) >> 7);
    exp = ((d.data[0] & 0x7F) << 4) | ((d.data[1] & 0xF0) >> 4);
    printf("expt: %4d (unbiassed %5d), ", exp, exp - 1023);
    mant = ((((d.data[1] & 0x0F) << 8) | (d.data[2] & 0xFF)) << 8) |
              (d.data[3] & 0xFF);
    mant = (mant << 32) | ((((((d.data[4] & 0xFF) << 8) |
              (d.data[5] & 0xFF)) << 8) | (d.data[6] & 0xFF)) << 8) |
              (d.data[7] & 0xFF);
    printf("mant: %16lld (0x%013llX)\n", mant, mant);
}

static void print_value(double v)
{
    union u_double d;
    union u_float  f;

    f.flt = v;
    d.dbl = v;

    printf("SPARC: float/double of %g\n", v);
    //image_print(stdout, 0, f.data, sizeof(f.data));
    //image_print(stdout, 0, d.data, sizeof(d.data));
    dump_float(f);
    dump_double(d);
}



int main (int argc, char **argv)
{
mpfr_t LIST;
mp_prec_t prec;
int pprec; /* will be prec - 1 for mpfr_printf */

prec = atoi (argv[1]);
pprec = prec - 1;

mpfr_inits2 (prec, LIST, (mpfr_ptr) 0);

if (mpfr_set_str (x, argv[2], 0, MPFR_RNDN))
{
fprintf (stderr, "rndo-add: bad x value\n");
exit (1);
}

mpfr_printf ("x = %.*RA\n", pprec, x);

float f1 = mpfr_get_flt ( x, MPFR_RNDN );

printf ("xx = %A\n", f1);

/*
if (mpfr_set_str (y, argv[3], 0, MPFR_RNDN))
{
fprintf (stderr, "rndo-add: bad y value\n");
exit (1);
}

mpfr_printf ("y = %.*RA\n", pprec, y);
*/

float f2 = atof(argv[3]);
int i = mpfr_set_flt ( y, f2, MPFR_RNDN );
mpfr_printf ("y = %.*RA\n", pprec, y);


mpfr_add (d, x, y, MPFR_RNDD);
mpfr_printf ("d = %.*Rf\n", pprec, d);

mpfr_add (u, x, y, MPFR_RNDU);
mpfr_printf ("u = %.*Rf\n", pprec, u);

mpfr_add (e, d, u, MPFR_RNDN);
mpfr_div_2ui (e, e, 1, MPFR_RNDN);
mpfr_printf ("e = %.*Rf\n", pprec, e);

mpfr_sub (z, u, e, MPFR_RNDN);
mpfr_add (z, z, d, MPFR_RNDN);
mpfr_printf ("z = %.*Rf\n", pprec, z);

mpfr_clears (LIST, (mpfr_ptr) 0);

float pi = (float)1;
    union {
        float f;
        uint32_t u;
    } f2u = { .f = pi };

    printf ("pi : %f\n   : 0x%" PRIx32 "\n", pi, f2u.u);
    
        printf("23.0 in hexadecimal is: %A\n", 23.0f);
        
        print_value(+1.0);
    print_value(+2.0);
    print_value(+3.0);
    print_value( 0.0);
    print_value(-3.0);
    print_value(+3.1415926535897932);
    print_value(+1e126);
    
return 0;
}

