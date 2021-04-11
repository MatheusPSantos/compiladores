all: geraC compila testa

geraC:
	flex -i -o analisadorpascal.c analisadorpascal.l
compila:
	gcc analisadorpascal.c -o analisadorpascal.bin
testa:
	./analisadorpascal.bin entrada.txt
limpa:
	rm -f analisadorpascal.c analisadorpascal.bin

	
