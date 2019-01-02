/*
 * File:   ej4.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */
 
%{
#include <stdio.h>
#include <math.h>
%} 
DIGITOS     0|1|2|3|4|5|6|7|8|9
%%
{DIGITOS}       printf ("%d",atoi(yytext)+1);
\n              printf("\n\n");
%%
int main() {
    yylex();
    return 0;
}
