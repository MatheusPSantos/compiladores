all: geraC compila testa

geraC:
	flex -i -o exemplo02.c exemplo02.l
compila:
	gcc exemplo02.c -o exemplo02.bin
testa:
	./exemplo02.bin entrada.txt
limpa:
	rm -f exemplo02.c exemplo02.bin

	
