all: geraC compila testa

geraC:
	flex -i -o exemplo01.c exemplo01.l
compila:
	gcc exemplo01.c -o exemplo01.bin
testa:
	./exemplo01.bin entrada.txt
limpa:
	rm -f exemplo01.c exemplo01.bin

	
