/*
 * File:   ej7.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */

%{
   #include <stdio.h>
   #include <string.h>
    //Inicializo contadores principales
    int contEA = 0;
    int contEMD = 0;
    int contEPS = 0;
    int contDRM = 0;
    //Inicializo contador de caraceres del array yytext
    int contEMD2 = 0;
    //contador y variables para detectar tercer caso (EPS)
    int j = 0;
    //como no me ha reconocido booleanos usaré enteros. ea1=1|ea1=0, ea2=1|ea2=0
    int ea1 = 1;
    int ea2 = 1;
    //vector en el que guardaré la primera escala si se detecta tercer caso (EPS)
    char vector [14];
    
%}
UNO     [1]
OCT     [0-8]
EA      [C]{OCT}\n*[D]{OCT}\n*[E]{OCT}\n*[F]{OCT}\n*[G]{OCT}\n*[A]{OCT}\n*[B]{OCT}\n*
DRM     C{OCT}\n*D{OCT}\n*E{OCT}\n*


%%
{EA}            {contEA++; contDRM++;} //Ha encontrado una EA
{EA}{EA}+       {for (int i =0; i<yyleng; i++) {   //Ha detectado 2 o más EA consecutivas almacenados en yytext
                       if(yytext[i] != '\n'){
                          //cuento el numero de caracteres almacenados en yytext que no sean espacios
                          contEMD2++;
                          if (j<14) {
                          //filtro en vector[] la primera escala detectada para comprobar si cumple condiciones EPS
                          vector[j] = yytext [i];
                          j++;
                          }
                     }
                 }
                 for (int i = 1; i < 14; i+=2) {
                      if (vector [i] != '1') {
                         //caso en que no se cumple que primera EA está en primera escala
                         ea1 = 0;
                         }
                      if (vector [i] != '2') {
                         //caso en que no se cumple que segunda EA está en segunda escala
                         ea2 = 0;
                         }
                 }
                 if (ea1 == 1 || ea2 == 1) {
                 contEPS += 1;
                 }
                 contEMD += 1;                    
                 contEA += (contEMD2+1) / 14;
                 contDRM += ((contEMD2+1) / 14);
                 contEMD2 = 0;
                 }

{DRM}           {contDRM++;}   // Ha detectado la secuencia C D E

.|\n	
%%
int main() {
yylex();
int i = 0;
printf("EA:%d\n",contEA);
printf("EMD:%d\n",contEMD);
printf("EPS:%d\n",contEPS);
printf("DRM:%d\n",contDRM);




   
   return 0;
}

