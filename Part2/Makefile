parser: y.tab.c lex.yy.c
	gcc -o parser y.tab.c
y.tab.c: CS315f21_team16.yacc
	yacc CS315f21_team16.yacc
lex.yy.c: CS315f21_team16.lex
	lex CS315f21_team16.lex
clean:
	rm -f lex.yy.c y.tab.c parser