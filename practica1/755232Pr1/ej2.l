/*
 * File:   ej2.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */
 
%{
#include <stdio.h>
int contador = 0;
%} 

%%
@hotmail    {contador++; printf("@hotmail");}
%%
int main() {
   yylex();
   printf ("Total de usuarios: %d",contador);
   return 0;
}
