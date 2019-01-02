/*
 * File:   ej2.l
 * Author: Diego Marco
 * Date:   noviembre 2018
 * Coms:   Práctica2 
 */



%{
   #include <stdio.h>
   #include <math.h>
   #define MAX 100
   //inicialización contadores
   int T = 0; //total codigo (sin comentarios)
   int C = 0; //total lineas comentarios
   int constant = 0; //total constantes 
   int Flineas = 0; //total lineas cada función
   double puntuacion = 0;
   //en cada posición del vector almaceno el número de lineas de una función detectada
   
   int vector[MAX];
   int i = 0; //    para recorrer el vector, equivale al número de funciones detectadas.
   double media = 0.0;
   double desvEst = 0.0;
%}

%s coment1 
%s coment2 
%s coment3
%s funcion
%%
"//".*                  {C++; BEGIN(coment2);} //caso comentario tipo //....\n
"/*".*                  {if (yytext[yyleng-2]== '*' && yytext [yyleng-1] == '/') {
                            C++; BEGIN(coment3); //caso comentario tipo /*......*/
                           }
                         else {
                            BEGIN(coment1);   //caso comentario tipo // /*..\n..\n..*/
                         }
                         }
<coment3>\n?            {BEGIN(INITIAL);} 
<coment1>"*/\n"         {C++;BEGIN(INITIAL);}
<funcion>\n             {T++; Flineas++;}
<coment1>\n             {C++;}            
<coment2>\n             {BEGIN(INITIAL);} 
const.*                 {constant++;}
\n                      {T++;}
^"{".*                   {BEGIN(funcion); Flineas++;} //caso funcion                       
<funcion>"}".*          {Flineas++; vector[i]=Flineas; Flineas = 0; i++;BEGIN(INITIAL);} 


.*|\n 	
%%
int main() {
    yylex();
    for (int j = 0; j< i; j++) {
            media += vector[j];    
        }
    media = media / i;    //calculo promedio de lineas de funciones
    for (int j = 0; j < i; j++) {
        
        desvEst+= pow(vector[j] - media,2.0); //Calculo la desviacion estandar
    }
    //calculo la puntuacion
    double porcentaje = ((double)C / (double)T)*100;
    
    if (porcentaje >= 10.0 && porcentaje <= 50.0) {
        puntuacion +=4; 
        
    }
    
    if (constant > 0) {
        puntuacion += 1;
    }
    porcentaje = 0;
    for (int j = 0; j<i; j++) {
        porcentaje += vector [j];
    }
    porcentaje = porcentaje / T;
    if (porcentaje >= 20 && porcentaje <= 30) {
        puntuacion += 2.5;
    }
    
    if (desvEst < 5) {puntuacion += 2.5;}
    
    //saco por pantalla resultados pedidos
    desvEst = sqrt( desvEst / i);
    printf("T:%d\n",T);
    printf("C:%d\n",C);
    printf("CONST:%d\n",constant);
    printf("F:%d\n",i);
    printf("FM:%.2f\n",media);
    printf("FS:%.1f\n",desvEst);
    printf("P:%.1f\n",puntuacion);
    return 0;
}
