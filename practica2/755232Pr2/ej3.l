/*
 * File:   ej3.l
 * Author: Diego Marco
 * Date:   noviembre 2018
 * Coms:  práctica2
 */
 
%{
    #include <stdio.h>
%}

%%
casa|cas.?|casa.|(ca.?|cas.|(c.?|ca.|(.|c.|.c)?a)s)a|(ca.?|cas.|(c.?|ca.|(.|c.|.c)?a)s).?|(cas.?|casa.|(ca.?|cas.|(c.?|ca.|(.|c.|.c)?a)s)a).|((c.?|ca.|(.|c.|.c)?a).?|(ca.?|cas.|(c.?|ca.|(.|c.|.c)?a)s).|((.|c.|.c)?.?|(c.?|ca.|(.|c.|.c)?a).|(..?|(.|c.|.c)?.|..c)a)s)a               {printf("%s\n",yytext);}

.|\n
%%
int main() {
    //uso espresion regular resultante de convertir un automata finito no determinista con Jflap.
    //Saca por pantalla aquellas palabras con una distancia Levenshtein <= 2, de la palabra casa
    yylex();
    return 0;
}
