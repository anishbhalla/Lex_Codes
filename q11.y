/* Practical 11: Recognize String Pattern a^n b^n (YACC) */

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token A B

%%

program: S '\n' { 
    printf("Valid string of the language a^n b^n (n>=1)!\n"); 
    exit(0); 
};

S: A B
 | A S B
;

%%

void yyerror(const char *s) {
    printf("Invalid string! Not in language a^n b^n (n>=1)\n");
    exit(1);
}

int main() {
    printf("Enter a string (a's followed by b's): ");
    yyparse();
    return 0;
}
