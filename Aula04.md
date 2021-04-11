# Análise Sintática

- Analise léxica se ocupou das construçẽso de _pequena escala_ (indentificar símbolos terminais nas cadeias de caracteres).
- Análise sintática se **ocupará** das construções de **grande escala**: determinar quando uma sequeência de **símbolos** corresponde a alguma das regras da gramática.

### Análise sintática ascendente

- Das folhas para a raiz

```
<atribuição>
    /|\
<id> =  <expr>
 |        /|\
 A    <id> * <expr>
       |    /  |   \
       B   ( <expr> )
              /|\
          <id> + <expr>
                    |
                    <id>
                    |
                    C
```

## Gramática

Para construir um analisador sintático é preciso definir uma gramática, isto é, as **regras de uma gramática**.

- Como definir uma gramática que vai me dar uma árvore sintática?

### BNF

Métodos formais para descrever **sintaxe**

- Forma de Backus-Naur (BNF) e Gramática Livre de Contexto

### Regras de Produção

            Forma:
        regra: definição;

          Convenção:
    Símbolo terminais: MAIÚSCULAS
    Simbolos não terminais: minúsculos

**atribuicao**: IDENT S_ATRIBUICAO **expressao**;

**expressao**: IDENT SMAIS SIDENT | IDENT SMENOS SIDENT | SIDENT;

### Gramática de pequena linguagem (exemplo)

```
<programa> -> begin <lista_inst> end
<lista_inst> -> <inst> | <inst>; <lista_inst>
<inst> -> <var> = <expressão>
<var>-> A| B | C
<expressão> -> <var> + <var> | <var> - <var | <var>
```

O primeiro símbolo é chamado de Raiz da análise sintática.

- Exemplo de programas nesta linguagem:

```
begin
  C = A + B;
  C = A;
end
```

```
begin
  A = A;
  A = B;
end
```

- A sintaxe do programa é válida?

```
begin
C = A + B;
<var> = <var> + <var>; (<var>-> A| B | C)
<var> = <expressão>;    (de <expressão> -> <var> + <var> )
<inst>;  (de <inst> -> <var> = <expressão>)

B = A;
var = var;
var = <expressão>;
<inst>;

<inst>;<inst>
<inst>;<lista_inst>
<lista_inst>
end

begin <lista_inst> end
<programa>

```

- Tudo foi reduzido em um `<programa>`

  > obs: se retirar o ; no final, então o programa está correto

- A Gramática não pode ser ambígua. O compilador não pode possuir duas árvores sintáticas ou mais, somente uma;
