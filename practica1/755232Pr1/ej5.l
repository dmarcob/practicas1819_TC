/*
 * File:   ej5.l
 * Author: Diego Marco
 * Date:   octubre 2018
 * Coms:   Práctica1
 */



%{
   #include <stdio.h>
   #include <math.h>
   int v[7];
   int contadorS=0;
   int contadorL=0;
   int contadorB=0;
%}
DIGITO	  ^[0-9]
%%
{DIGITO}	v[atoi(yytext)-1]++;
[S]		contadorS++;
[L]		contadorL++;
[B]		contadorB++;
.|\n	
%%
int main() {

   for (int i=0; i<7;i++)  {
	v[i]=0;
   }
   yylex();
   for (int i=0; i<7; i++) {
	printf("T%d: %d\n",i+1,v[i]);
   }
   printf("FS: %d\n",contadorS);
   printf("FL: %d\n",contadorL);
   printf("FB: %d\n",contadorB);
   
   if ((contadorS >= contadorL) && (contadorS >= contadorB)) {
	printf("MM: Stark");
   }
   else if ((contadorL >= contadorS) && (contadorL >= contadorB)){
   	   printf("MM: Lannister");
   }
   else{
	printf("MM: Baratheon");
   }
   return 0;
}
