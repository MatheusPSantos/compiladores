# Roda o flex no arquivo de entrada exemplo01.l
flex -o exemplo01.c exemplo01.l

# Compila o arquivo gerado exemplo01.c e gera o analisador léxico executável "exemplo01.bin"
gcc exemplo01.c -o exemplo01.bin

# Executa o exemplo01.bin
# passando o arquivo exemplo01.codigofonteC como entrada (redireciona entrada padrão: stdin)
# escrevendo no arquivo exemplo01.saida (redireciona a saída padrão: stdout)
exemplo01.bin < exemplo01.codigofonteC > exemplo01.saida


#Observações
#No shell Linux 
# "< Nome_do_arquivo" redireciona a entrada padrão para o arquivo.
# "> Nome_do_arquivo" redireciona a saída padrão para o arquivo
# "2> Nome_do_arquivo" redireciona a saída de erro padrão para o arquivo
# /dev/null é uma saída nula. 


