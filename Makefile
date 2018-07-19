all: lmao

lmao: lmao.asm
	nasm lmao.asm -f bin -o lmao
	chmod +x lmao