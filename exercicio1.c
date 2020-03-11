#include <stdio.h>
#include <termios.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

int keyword_library(char temp[])
{
  int count = 0, flag = 0;
  char keywords[32][12] = {"return", "continue", "extern", "static", "long", "signed",
                           "switch", "char", "else", "unsigned", "if", "struct",
                           "union", "goto", "while", "float", "enum", "sizeof", "double", "volatile",
                           "const", "case", "for", "break", "void", "register", "int",
                           "do", "default", "short", "typedef", "auto"};
  while (count <= 31)
  {
    if (strcmp(keywords[count], temp) == 0)
    {
      flag = 1;
      break;
    }
    count = count + 1;
  }
  return (flag);
}

int main(int argc, char **argv)
{
  ++argv;
  --argc;

  if (argc > 0)
  {

    char ch, temp[40], arithmetic_operator[] = "=+%*/-";
    FILE *file_pointer;
    int count, x = 0;
    file_pointer = fopen("C:\\Users\\tusoni\\Desktop\\demo.txt", "r");
    if (file_pointer == NULL)
    {
      printf("The file could not be opened.\n");
      exit(0);
    }
    while ((ch = fgetc(file_pointer)) != EOF)
    {
      count = 0;
      while (count <= 5)
      {
        if (ch == arithmetic_operator[count])
        {
          printf("\nOperator:\t%c", ch);
        }
        count = count + 1;
      }
      if (isalnum(ch))
      {
        temp[x++] = ch;
      }
      else if ((ch == '\n' || ch == ' ') && (x != 0))
      {
        temp[x] = '\0';
        x = 0;
        if (keyword_library(temp) == 1)
        {
          printf("\nKeyword:\t%s", temp);
        }
        else
        {
          printf("\nIdentifier:\t%s", temp);
        }
      }
    }
    fclose(file_pointer);
    getch();
    return 0;
  }
  else
  {
    printf("Nenhum arquivo para leitura informado...\n");
    printf("Informe um arquivo para leitura.\n [Exemplo]: >>> programa arquivo-para-leitura.txt\n");
  }
}