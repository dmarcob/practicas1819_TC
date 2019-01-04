/*
 * File:   newick.l
 * Author: Diego Marco
 * Date:   Enero 2019
 * Coms:   Práctica 4
*/

%{
#include "y.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}



%%

"("                          {return OP;}
")"                          {return CP;}
[a-z|A-Z]+[a-z|A-Z|_|0-9]*   {yylval.datos.nombre = strdup(yytext); return(NODE);}
[0-9]+\.?[0-9]*              {yylval.datos.altura = atof(yytext);return(HIGH);}
":"                          {return(COLON);}
","                          {return COMA;}
";"                          {return SEMICOLON;}
.|\n

%%


//patron...			{/*Ejemplo modificar yylval segun %union en newick.y*/
//					 yylval.datos.altura = atof(yytext);return(....);}
//patron...			{/*Ejemplo modificar yylval segun %union en newick.y*/
//		  			  yylval.datos.nombre = strdup(yytext); return(....);}
