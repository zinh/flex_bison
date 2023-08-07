%option noyywrap

%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[a-zA-Z]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. {chars++;}
%%

int
main(int argc, char** argv) {
  if (argc < 2) {
    yylex();
    printf("line = %d; words = %d; chars = %d\n", lines, words, chars);
    return 0;
  }
  for (int n = 1; n < argc; n++) {
    FILE *f = fopen(argv[n], "r");
    if (!f) {
      perror(argv[n]);
      return 1;
    }

    yyrestart(f);
    yylex();
    fclose(f);
    printf("%s\n", argv[n]);
    printf("line = %d; words = %d; chars = %d\n", lines, words, chars);
  }

  return 0;
}
