/*
 * File:   ej1.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */
 
%{
#include <stdio.h>
%} 

%%
@hotmail        {printf("@gmail");}
%%
int main() {
   yylex();
}
