## Compiladores - Aula 02

Analisador léxico:
  Encontrar palavras que existem na linguagem, ou que não existem
  conjunto fechado de palavras que são reconhecidos na linguagem: Tokens

Análise sintática: ordem das palavras dentro da linguagem

Análise semântica: significa como será gerado o código alvo

### Analisador léxico

  A análise léxica e sintática são as primeiras etapas do processo de compilação.
  O <b>analisador léxico</b> trata das construções de pequena escala da linguagem.
  O <b>analisador sintático</b> trata as construções de larga escala (estrutura).

##### exemplo

Comando <b>if</b> em C:
Sintáxe:
```
  if(<expressao>) <instrução>
```
Semântica: Se o valor é verdadeiro a instrução é executada, se não, a instrução não é executada.

Na maioria dos compiladores a parte léxica e sintática são implementadas separadamente.


#### Questões de implementação
  - Tecnicamente a análise léxica faz parte da análise sintática
  - Anaisador léxico -> coletar sequencias de caracteres em agrupamentos lógicos e atribuir codigos internos a cada agrupamento
  - ignorar brancos
    - agrupamentos: lexema
    - códigos: token

  #### exemplo
<code>
  index = 2 * count + 17;
</code>

|Lexemas|index, = , 2, *, count, +, 17, ;|
|-------|-------|
|tokens|identificador, sinal_igual, int_literal, op_mult, identificador, op_mais, int_literal, ponto_virgula|

### Exercício

1) `for (int i = 0; i<10; i++)`

|Lexema|Tokens|
|------|------|
|for   |comando_repeticao|
|(     |parentese_esquerdo|
| int |ident_inteiro|
| i |identificador|
| = |sinal_igual|
| 0 |inteiro_literal|
|; |ponto_virgula|
|i|identificador|
|<|sinal_menor_que|
|10|inteiro_literal|
|;|ponto_virgula|
|i|identificador|
|++|op_incrementar|
|)|parentese_direito|


2) `cont = cont + 1;`

|Lexema|Tokens|
|------|------|
|cont| identificador|
| = | sinal_igualdade|
| cont | identificador|
| + | op_somar|
| 1 | inteiro_literal|
|;|ponto_virgula|

3) `cont ++;`

|Lexema|Tokens|
|------|------|
|cont | identificador|
|++| OP_INCREMENTAR|
|;|ponto_virgula|

4) `x = Cont1 + Cont2 * 3;`

|Lexema|Tokens|
|------|------|
| x | identificador |
| = | sinal_igualdade |
| Cont1 | identificador |
| + | op_soma |
| Cont2 | identificador |
| * | op_multiplicacao| 
| 3 | inteiro_literal|
|;|ponto_virgula|


### Questões de implementação analisador léxico
* Exemplo:
  - Identificadores
      - letras maiusculas e minusculas são diferentes
      - etc.

* Implementar um diagrama de transição
* Definir uma classe de caracteres


#### Exercícios 
1) Implementar um analisador léxico em C para reconhecer identificadores da linguagem C
2) Implementar um analisador léxico em C para reconhecer strings na lingaugem Pascal

