/* Practical 12: Recognize Language (a^n b, n>=10) (YACC) */

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token A B

%%

program: S '\n' { 
    printf("Valid string! Input belongs to language (a^n b, n>=10)\n"); 
    exit(0); 
};

S: A A A A A A A A A A B
 | A S
;

%%

void yyerror(const char *s) {
    printf("Invalid string! Does not belong to language (a^n b, n>=10)\n");
    exit(1);
}

int main() {
    printf("Enter a string: ");
    yyparse();
    return 0;
}
