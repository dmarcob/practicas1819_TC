/*Autor: Diego Marco 755232
 *Archivo:ej21.y
 *Fecha: 25 noviembre, 2018 
 */
%{
#include <stdio.h>
%}
%token NUMBER EOL CP OP
%start calclist
%token ADD SUB
%token MUL DIV
%%

calclist : /* nada */
	| calclist exp EOL { printf("=%d\n", $2); }
	;
exp : 	factor
	| exp ADD factor { $$ = $1 + $3; }
	| exp SUB factor { $$ = $1 - $3; }	
	| exp ADD NUMBER { $$ = $1 + $3; }
	| exp SUB NUMBER { $$ = $1 - $3; }
	| NUMBER { $$ = $1; }	
	;
factor : 	factor MUL factorsimple { $$ = $1 * $3; }
		| factor DIV factorsimple { $$ = $1 / $3; }
		| factorsimple MUL factorsimple { $$ = $1 * $3; }
		| factorsimple DIV factorsimple { $$ = $1 / $3; }
		;
factorsimple : 	OP exp CP { $$ = $2; }
		| NUMBER
		;
%%
int yyerror(char* s) {
   printf("\n%s\n", s);
   return 0;
}
main() {
  yyparse();
}

