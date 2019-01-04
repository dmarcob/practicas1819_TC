%{
#include <stdio.h>
#include <string.h>

	//el numero de hojas se puede guardar en una variable global
	int numHojas = 0;
%}

%union {
	struct nodo {
		char* nombre;
		float altura;
	} datos;
}


%token  OP NODE COLON HIGH COMA CP SEMICOLON
%start  arbol

%type<datos> NODE HIGH arbol contenido_1 contenido_2 contenido_3 existe_nodo existe_distancia//.... declararar todos los tokens y variables necesarios que necesiten guardar "datos" (ver %union)


%%
arbol : contenido_1 existe_nodo existe_distancia SEMICOLON { $$.altura = $1.altura + $3.altura; 
                                                             printf("La altura es %.2f\n",$$.altura);
                                                        $$.nombre = $2.nombre; printf("La raiz se llama %s\n",$$.nombre);
                                                          };
contenido_1: OP contenido_2 CP { $$.altura = $2.altura;};

contenido_2: contenido_3       { $$.altura = $1.altura;};
            |contenido_2 COMA contenido_3 {if($1.altura > $3.altura) {$$.altura = $1.altura;}
                                           else {$$.altura = $3.altura;}};

contenido_3: contenido_1  existe_nodo existe_distancia { $$.altura += $3.altura;printf("altura (contenido_3(1)):  %.d\n",numHojas);};
            |existe_nodo existe_distancia { if($$.altura < $2.altura) {$$.altura = $2.altura;} numHojas++;
                                            printf("altura (conteido_3(2)):  %d\n",numHojas);};
            
existe_nodo: /*nada*/ {$$.nombre = "";}
            |NODE     {$$.nombre = $1.nombre;};

            
existe_distancia: /*nada*/ {$$.altura = 1;}
                | COLON HIGH {$$.altura = $2.altura;};

%%
int yyerror(char* s) {
	printf("%s\n", s);
	return -1; 
}

int main() {
	int error = yyparse();
	//si se han definido variables globales:
	//si no hay error, se sacan los mensajes.
	if (error == 0) {
		printf("El numero de hojas es %d\n", numHojas);
	}

}

//reglas...
// .....		{/*ejemplo para cambiar campo altura y nombre*/
//			  $$.altura = $3.altura; 
//			  $$.altura = $1.altura + $3.altura; 
//			  $$.nombre = strdup($1.nombre);}
