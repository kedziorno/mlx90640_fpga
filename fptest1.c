#include <stdio.h>
#include <stdlib.h>
#include <mpfr.h>

int main(int argc,char **argv)
{

mpfr_t xa, xb, xc;
int i;
float a, b, c;

mpfr_set_default_prec (atoi(argv[1]));

mpfr_set_emin (atoi(argv[2]));
mpfr_set_emax (atoi(argv[3]));

mpfr_init (xa);
mpfr_init (xb);
mpfr_init (xc);

c = 1.0;
mpfr_set_d (xc, c, MPFR_RNDN);

b = atof(argv[4]);
mpfr_set_d (xb, b, MPFR_RNDN);

a = atof(argv[5]);
mpfr_set_d (xa, a, MPFR_RNDN);

printf ("a %f\n", a);
printf ("b %f\n", b);

mpfr_printf ("aaa %Rf\n", xa);
mpfr_printf ("bbb %Rf\n", xb);

i = mpfr_mul (xa, xa, xc, MPFR_RNDN);
i = mpfr_subnormalize (xa, i, MPFR_RNDN); /* new ternary value */

i = mpfr_mul (xb, xb, xc, MPFR_RNDN);
i = mpfr_subnormalize (xb, i, MPFR_RNDN); /* new ternary value */

mpfr_printf ("aaa %Rf\n", xa);
mpfr_printf ("bbb %Rf\n", xb);

mpfr_clear (xa);
mpfr_clear (xb);
}

