now = $(shell date +"%h-%d-%HH")

all:
	@./tt_sh/latex.sh  main. #1> .log

push:
	git add -A
	git commit -am "no comment"
	git push

copy:
	cp main.pdf grub-$(now).pdf

clean:
	rm main.aux main.blg main.out main.run.xml main.bbl main.dvi main.pdf main.log main.ps

