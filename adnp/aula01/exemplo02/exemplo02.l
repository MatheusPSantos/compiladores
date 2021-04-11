/**************************************************************
 exemplo02.l

 Arquivo de regras para gerar uma analisador léxico com flex.

 Como gerar o analisador léxico: na linha de comando digite:
 flex -i -o exemplo01.c exemplo01.l 
 gcc exemplo01.c -o exemplo01.bin
 
 Como usar o analisador léxico gerado: na linha de comando,
 no diretorio onde o arquivo executável foi gerado, digite:
 ./exemplo01.bin entrada.txt

**************************************************************/
 
%option noyywrap
%{
#include <stdio.h>
int num=1;
%}

CPF	[0-9]{3}"."[0-9]{3}"."[0-9]{3}"-"[0-9]{2}
PALAVRA [a-z0-9.]+
%%

{CPF}		{printf("Achei um CPF na linha [%d]: [%s]\n",num,yytext);}
{PALAVRA}	/* Ignora palavras */
<<EOF>>		{	printf("FIM.\n"); 
			exit(0);
		}
\n 		{num++;}
[\t ]		/* Ignora tabulação e espaços em branco*/
.		{printf("Símbolo [%s] desconhecido na linha [%d].\n",yytext,num);}

%%

int main(int argc, char **argv){
	// 2 Argumentos: argv[0]: nome do programa (exemplo. modelo.exe)
	//               argv[1]: arquivo de entrada (exemplo: entrada.txt);
	if(argc < 2){
		printf("Help\n\tUso:./exemplo01.exe <arquivo_entrada>\n");
		exit(1);
	}
	else{
		yyin = fopen(argv[1],"r");
		if(yyin == NULL) {
			printf("Erro ao abrir arquivo [%s]\n",argv[1]);
			exit(1);
		}
		// Chama a função que implementa o analisador léxico.
		// Percorre o arquivo de entrada até encontrar <<EOF>>.
		yylex();
	}
}

