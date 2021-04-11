%option noyywrap
%{
#include <stdio.h>
#define S_IF	100
#define S_ELSE	101
#define S_ABRECHAVES	102
#define S_FECHACHAVES	103
#define S_PONTOVG		104
#define S_NUMERO		105
#define S_IDENTIFICADOR 106
char lexema[300];
int  numero_da_linha=0;
%}
DIGITO			[0-9]
IDENTIFICADOR	[a-zA-Z][a-zA-Z0-9]*

%%
if 		{strcpy(lexema,yytext); return(S_IF);}
else    {strcpy(lexema,yytext);return(S_ELSE);}
"{"		{strcpy(lexema,yytext);return(S_ABRECHAVES);}
"}"		{strcpy(lexema,yytext);return(S_FECHACHAVES);}
";"		{strcpy(lexema,yytext);return(S_PONTOVG);}

{DIGITO}+	{
				strcpy(lexema,yytext); 
				return(S_NUMERO);
			}	

{IDENTIFICADOR}	{
					strcpy(lexema,yytext);
					return(S_IDENTIFICADOR);
				}

<<EOF>>	{
			printf("Fim de arquivo encontrado.\n"); 
			return(0);
		}	
\n 	{numero_da_linha++;}
.	{printf("\tSímbolo desconhecido:[%s]\n",yytext);}

%%

int main(){
	int simbolo = yylex();
	while(simbolo != 0){
		printf("Lexema=[%s]\tToken=%d\n",lexema,simbolo);
		simbolo=yylex();
	}
}

