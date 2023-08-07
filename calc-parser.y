%{
#include <stdio.h>
#include <math.h>
int yylex(void);
void yyerror(char const *);
%}

%token NUMBER
%token ADD SUB MUL DIV
%token EOL

%%
input:
     %empty
     | input line
     ;

line:
    EOL
    | exp EOL { printf("%d\n", $1); }
    ;

exp:
   factor
   | exp ADD factor { $$ = $1 + $3; }
   | exp SUB factor { $$ = $1 - $3; }
   ;

factor:
   NUMBER
   | factor MUL factor { $$ = $1 * $3; }
   | factor DIV factor { $$ = $1 / $3; }
%%

int
main(int argv, char** argc) {
  yyparse();
}

void
yyerror(char const *s) {
  fprintf(stderr, "error: %s\n", s);
}
