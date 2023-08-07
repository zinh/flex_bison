word_count: word_count.yy.c
	cc word_count.yy.c -ll -o word_count

word_count.yy.c: word_count.l
	flex -o word_count.yy.c word_count.l

calc: calc-parser.y calc-scanner.l
	bison -d calc-parser.y
	flex calc-scanner.l
	cc -o $@ calc-parser.tab.c lex.yy.c -ll

clean:
	rm -f word_count.yy.c word_count calc-parser.tab.c calc-parser.tab.h lex.yy.c calc
