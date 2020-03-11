%option noyywrap
// IPDIGIT [0-20-5]|[25[0-5]]|[2[0-4][0-9]]|[01[0-9][0-9]]
IPDIGIT [0-2][]
OCTETO  IPDIGIT{3}
%%
{IPDIGIT}    { printf("Um digito valido para ip: %s\n", yytext); }
"."          { printf("\nSeparador de octeto: %s\n", yytext); }
<<EOF>>      { printf("Fim.\n"); exit(0); }
%%
int main(int argc, char **argv) { 
  ++argv;
  --argc;

  if(argc > 0) {
    yyin = fopen(argv[0], "r");
  } else {
    printf("Informe um arquivo...\n");
    return 0;
  }

  yylex();
}

