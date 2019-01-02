/*
 * File:   ej3.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */
 
%{
#include <stdio.h>
%} 

%%
@unizar\.es     {printf("@gmail.com");} //para que . no sea un caracter comodin => \. o "."
%%
int main() {
   yylex();
   return 0;
}
