/* Gram-Schmidt orthonomalization */
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

#define DIM 3
typedef double Basis[DIM][DIM];
typedef double Vector[DIM];

void gram_schmidt_orthonormalization(Basis, Basis);
void cp_vector(Vector, Vector);
double inner_product(Vector, Vector);
void mul_vector(Vector, double, Vector);
void sub_vector(Vector, Vector, Vector);
void normalize_vector(Vector, Vector);
void print_basis(Basis);

int main(int argc, char *argv[])
{
    Basis vs = {{1, 1, 0}, {1, 3, 1}, {2, -1, 1}};
    Basis us;

    gram_schmidt_orthonormalization(vs, us);
    print_basis(us);

    return 0;
}

void gram_schmidt_orthonormalization(Basis vs, Basis us)
{
    int j, k;
    Vector vd, svd;

    for( j = 0; j < DIM; j++ ){
        cp_vector(vd, vs[j]);
        if( j != 0 ){
            for( k = 0; k < j; k++ ){
                mul_vector(svd, inner_product(vs[j], us[k]), us[k]);
                sub_vector(vd, vd, svd);
            }
        }
        normalize_vector(us[j], vd);
    }

    return ;
}

void cp_vector(Vector d, Vector s)
{
    int i;

    for( i = 0; i < DIM; i++ ){
        d[i] = s[i];
    }

    return ;
}

double inner_product(Vector u, Vector v)
{
    int i;
    double inner_product = 0;

    for( i = 0; i < DIM; i++ ){
        inner_product += u[i] * v[i];
    }

    return inner_product;
}

void mul_vector(Vector ans, double scal, Vector src)
{
    int i;

    for( i = 0; i < DIM; i++ ){
        ans[i] = scal * src[i];
    }

    return ;
}

void sub_vector(Vector ans, Vector fst, Vector snd)
{
    int i;

    for( i = 0; i < DIM; i++ ){
        ans[i] = fst[i] - snd[i];
    }

    return ;
}

void normalize_vector(Vector d, Vector s)
{
    int i;
    double denom = sqrt(inner_product(s, s));

    for( i = 0; i < DIM; i++ ){
        d[i] = s[i] / denom;
    }

    return ;
}

void print_basis(Basis u)
{
    int i, j;

    for( i = 0; i < DIM; i++ ){
        printf("vector[%d]: {", i+1);
        for( j = 0; j < DIM; j++ ){
            printf("%lf", u[i][j]);
            if( j != DIM-1 ){
                printf(", ");
            }
        }
        printf("}\n");
    }

    return ;
}
