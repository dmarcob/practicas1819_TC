/*
 * File:   ej1.2.l
 * Author: Diego Marco
 * Date:   noviembre 2018
 * Coms:   Práctica2 Descompresor
 */



%{
   #include <stdio.h>
   #include <math.h>
%}

%s fasta
%%
\n                         {printf("\n");BEGIN(fasta);}
<fasta>>                   {printf(">");BEGIN(INITIAL);}
<fasta>[T|C|G|A][0-9]+     {for (int i = 0; i < atoi(yytext+1); i++) {
                                printf("%c",yytext[0]);
                            }
                            }
                                 	
%%
int main() {
    yylex();
    return 0;
}
