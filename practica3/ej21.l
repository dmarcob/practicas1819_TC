/*Autor: Diego Marco 755232
 *Archivo:ej21.l
 *Fecha: 25 noviembre, 2018 
 */
%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[01]+b {int decimal = 0; int exponente = 0;
        for (int i = yyleng-2; i>=0; i--) {
                            if (yytext[i] == '1'){
                decimal += pow(2,exponente);
             }
             exponente++;
        }      
        yylval = decimal; return(NUMBER);
        }
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
