%option noyywrap
%{
  #include <stdio.h>
  #define S_AND 100
  #define S_ARRAY 101
  #define S_BEGIN 102
  #define S_CASE 103
  #define S_CONST 104
  #define S_DIV 105
  #define S_DO 106
  #define S_DOWNTO 107
  #define S_ELSE 108
  #define S_FILE 109
  #define S_FOR 110
  #define S_FORWARD 111
  #define S_GOTO  112
  #define S_IF 113
  #define S_IN  114
  #define S_LABEL 115
  #define S_MAIN 116
  #define S_MOD 117
  #define S_NIL 118
  #define S_NOT 119
  #define S_OF 120
  #define S_OR 121
  #define S_PACKED 122
  #define S_PROCEDURE 123
  #define S_PROGRAM 124
  #define S_RECORD 125
  #define S_REPEAT 126
  #define S_SET 127
  #define S_THEN 128
  #define S_TO 129
  #define S_TYPE 130
  #define S_UNTIL 131
  #define S_VAR 132
  #define S_WHILE 133
  #define S_WITH 134

  #define S_DEFINE 135
  #define S_EXTERN 136
  #define S_EXTERNAL 137
  #define S_MODULE 138
  #define S_OTHERWISE 139
  #define S_PRIVATE 140
  #define S_PUBLIC 141
  #define S_STATIC 142
  #define S_UNIV 143

  #define S_FUNCTION 144

  #define S_SPECIAL_SYMBOL 145
  #define S_IDENTIFY 146

  char  lexema[300];
  int line_number = 0;
%}
SPECIAL_SYMBOL ([+]{0,2}) |[-]|[*]|[\/]|[=]|[<]|[>]|\[|\]|[.]|[,]|[:=]|[:]|[;]|\(|\)|[<>]|[<=]|[>=]|(..)|[^]|[~]|[&]|[\|]|[!]|[#]|[%]
IDENTIFY [a-zA-Z][a-zA-Z0-9]*

%%

  and   {strcpy(lexema, yytext);return (S_AND);}
  file    {strcpy(lexema, yytext);return (S_FILE);}
  mod   {strcpy(lexema, yytext);return (S_MOD);}
  repeat    {strcpy(lexema, yytext);return (S_REPEAT);}
  array   {strcpy(lexema, yytext);return (S_ARRAY);}
  for   {strcpy(lexema, yytext);return (S_FOR);}
  nil   {strcpy(lexema, yytext);return (S_NIL);}
  set   {strcpy(lexema, yytext);return (S_SET);}
  begin   {strcpy(lexema, yytext);return (S_BEGIN);}
  forward   {strcpy(lexema, yytext);return (S_FORWARD);}
  not   {strcpy(lexema, yytext);return (S_NOT);}
  then    {strcpy(lexema, yytext);return (S_THEN);}
  case    {strcpy(lexema, yytext);return (S_CASE);}
  function    {strcpy(lexema, yytext);return (S_FUNCTION);}
  of    {strcpy(lexema, yytext);return (S_OF);}
  to    {strcpy(lexema, yytext);return (S_TO);}
  const   {strcpy(lexema, yytext);return (S_CONST);}
  goto    {strcpy(lexema, yytext);return (S_GOTO);}
  or    {strcpy(lexema, yytext);return (S_OR);}
  type    {strcpy(lexema, yytext);return (S_TYPE);}
  div   {strcpy(lexema, yytext);return (S_DIV);}
  if    {strcpy(lexema, yytext);return (S_IF);}
  packed    {strcpy(lexema, yytext);return (S_PACKED);}
  until   {strcpy(lexema, yytext);return (S_UNTIL);}
  do    {strcpy(lexema, yytext);return (S_DO);}
  in    {strcpy(lexema, yytext);return (S_IN);}
  procedure   {strcpy(lexema, yytext);return (S_PROCEDURE);}
  var   {strcpy(lexema, yytext);return (S_VAR);}
  downto    {strcpy(lexema, yytext);return (S_DOWNTO);}
  label   {strcpy(lexema, yytext);return (S_LABEL);}
  program   {strcpy(lexema, yytext);return (S_PROGRAM);}
  while   {strcpy(lexema, yytext);return (S_WHILE);}
  else    {strcpy(lexema, yytext);return (S_ELSE);}
  main    {strcpy(lexema, yytext);return (S_MAIN);}
  record    {strcpy(lexema, yytext);return (S_RECORD);}
  with    {strcpy(lexema, yytext);return (S_WITH);}

  {SPECIAL_SYMBOL} {
    strcpy(lexema, yytext);
    return(S_SPECIAL_SYMBOL);
  }
  {IDENTIFY} {
    strcpy(lexema, yytext);
    return (S_IDENTIFY)
  }

  <<EOF>> {
    printf("Fim do arquivo.\n");
    return (0);
  }

  \n { line_number++;}
  . { printf("\terror: [%s]\n", yytext);}

%%

int main (int argc, char **argv) {
  if(argc < 2) {
    printf("Error: \tUso corretor: ./program.exe <arquivo_entrada>\n");
  } else {
    yyin = fopen(argv[1], "r");
    if(yyin == NULL) {
      printf("Erro ao abrir arquivo [%s].", argv[1]);
      exit(1);
    }
    int symb = yylex();
    while(symb != 0) {
      printf("\tok: [%s]\n", lexema);
      symb = yylex();
    }
  }
}