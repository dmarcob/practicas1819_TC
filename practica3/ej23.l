/*Autor: Diego Marco 755232
 *Archivo:ej23.l
 *Fecha: 25 noviembre, 2018 
 */
%{
#include "y.tab.h"
%}
%%
"acum" {return VAR;}
":=" {return EQU;}
"+"	{return(ADD);}
"-"	{return(SUB);}
"*"	{return(MUL);}
"/"	{return(DIV);}
"("	{return(OP);}
")"	{return(CP);}
[0-9]+	{yylval = atoi(yytext); return(NUMBER);}
\n	{return(EOL);}
[ \t]	{/* ignorar espacios */}
.	{return(yytext[0]); /* caracter inesperado */}
%%
