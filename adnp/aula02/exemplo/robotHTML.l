
%option noyywrap
%{
#include <stdio.h>
char nomeCurso[300];
%}

%%

[A-Z][A-ZÔÁÉÍÓÚÂÊÎÇÃÕ ]+/"</a></h3>" {
	printf("CURSO=%s\n",yytext);
}

<<EOF>>	{
			printf("Fim de arquivo encontrado.\n"); 
			exit(0);
		}	
[\n\t]	/* faz nada */
.		/* faz nada */
%%



int main(int argc, char **argv){
	// 2 Argumentos: argv[0]: nome do programa (exemplo. modelo.exe)
	//               argv[1]: arquivo de entrada (exemplo: entrada.txt);
	if(argc < 2){
		printf("Help\n\tUso:./roboHTML.bin <arquivo_entrada>\n");
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
