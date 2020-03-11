# Aula 03

## Compiladores - FELX (Gerador de analisadores léxicos)

Arquivo de regras --> FLEX --> Programa fonte em C para um analisador léxico **lex.yy.c**.

É uma ferramenta que específica algumas coisas na linguagem.

### formatação
**Formato do arquivo de regras**

DEFINIÇÕES
%%
REGRAS
%%
CÓDIGO DO USUÁRIO

**Seção de definições** > definições de nomes para simplificar especificações do analisador

*Exemplo*: 
DIGITO    [0-9]
ID        [a-z][a-z0-9] *
`{DIGITO}+"."{DIGITO}`

**Seção de Regras** > Diz o que vai fazer quando encontrar um padrao no arquivo de entrada
<padrã><ação>

onde 
*padrão* > expressão regular (não identar)
*ação* > normalmente comandos em C (devem começar na mesma linha)

**Seção de Código do Usuário** > O código em C é copiado para o arquivo de Saída (.c)

Qualquer texto identado ou entre %{ %{ é copiado como está para o arquivo de saída.

**Padrões da seção de regras** > São expressões reguladores.

### Função yylex()

Por padrão, a rotina yylex é declarada da seguinte forma:

```
int yylex() {
  ... definições e ações aqui
}
```

Toda vez que yylex() é chamada ela procura TOKENS no arquivo de entrada 'yyin' (que por padrão é a stdin).

yylex() continua até que alcance **EOF** quando retorna o valor 0 (zero) ou ...

Até que uma de suas ações execute o comando **return**.

### Exemplo

**Pascal Super Simples**
```
  DIGIT [0-9]
  ID    [a-z][a-z0-9]*
  %%
  {digit}+ { printf(“Um inteiro: %s\n”,yytext);}
  {digit}+”.”{digit}* {printf(“Um real: %s\n”, yytext);}
  
  if|then|else|begin|end|var|while { printf (“Palavra reservada: %s\n”,yytext);}
  {id}    { printf ( “Identificador : % s \ n ” , yytext );}
  
  “*”|”/“|”+”|”-“ { printf(“Operador:%s\n”,yytext);}
  “;=“    { printf(“Atribuição:%s\n,yytext);}
  “{“[^}\n]*”}”   /*faça nada: é comentário de uma linha*/
  [\t\n]+   /*espaço em branco e tabulações*/
  .     {printf(“Caractere não reconhecido: %s\n”,yytext);}
  %%
  int main(int argc, char **argv){ 
    ++argv; --argc; /* pula o nome do programa */ 
    if(argc > 0)  
      yyin = fopen(argv[0],”r”); 
    else  
      yyin = stdin; 
    yylex();}

```

