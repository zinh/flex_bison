%{
#include "calc-parser.tab.h"
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return EOL;}
[ \t] {}
. { printf("Invalid input %c\n", *yytext); }
%%
