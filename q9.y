/* ------------------------------------------------------------
   Practical 9: Validate Variable Names using YACC
   Rule: variable = LETTER followed by DIGIT
   ------------------------------------------------------------ */

%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token LETTER DIGIT

%%

program:
        variable '\n' { printf("Valid variable!\n"); exit(0); }
        ;

variable:
        LETTER DIGIT
        ;

%%

void yyerror(const char *s) {
    printf("Invalid variable!\n");
    exit(1);
}

int main() {
    printf("Enter a variable name (letter followed by digit): ");
    yyparse();
    return 0;
}
