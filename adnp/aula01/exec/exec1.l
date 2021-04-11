%option noyywrap
%{
  #include <stdio.h>
  #define S_1 101
  #define S_2 102
  #define S_3 103

  char lexema[300];
  int n_linha = 0;
%}

SEQ_1 [aAbBcCkK][0-9]{0,5}
SEQ_2 [0-9]([a-zA-Z0-9]|[a-zA-Z]{4}|-|[0-9]{2,5})
SEQ_3 [+]?([5]{2})?[ ]?(\(?[0-9]{2,3}\)?)?[ ]?[9][ ]?[0-9]{4}[-]?[0-9]{4}
%%
{SEQ_1} { printf("Sequencia 1 na linha: [%d]: [%s]\n", n_linha, yytext); }
{SEQ_2} { printf("Sequencia 2 na linha: [%d]: [%s]\n", n_linha, yytext); }
{SEQ_3} { printf("Sequencia 3 na linha: [%d]: [%s]\n", n_linha, yytext); }

<<EOF>> {
    printf("fim de arquivo encontrado.\n");
    return 0;
  }
\n { n_linha++;}
. {printf("\nSimbolo desconhecido: [%s]\n", yytext);}
%%

int main() {
  yylex();
}
