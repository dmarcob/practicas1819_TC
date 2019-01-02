/*
 * File:   ej1.1.l
 * Author: Diego Marco
 * Date:   noviembre 2018
 * Coms:   Práctica2 compresor
 */



%{
   #include <stdio.h>
%}

%s fasta
%%
\n                         {printf("\n");BEGIN(fasta);}
<fasta>>                   {printf(">");BEGIN(INITIAL);}
<fasta>TT+|CC+|GG+|AA+     {printf("%c",yytext[0]);                   
                           printf("%d",yyleng);  
                           }
                                 	
%%
int main() {
    yylex();
    return 0;
}
