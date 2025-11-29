/* Practical 10: Simple Calculator (YACC) */

%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex();
%}

%token NUMBER
%left '+' '-'
%left '*' '/'

%%

program: expr '\n' { 
    printf("Result: %d\n", $1); 
    exit(0); 
};

expr: expr '+' expr { $$ = $1 + $3; }
    | expr '-' expr { $$ = $1 - $3; }
    | expr '*' expr { $$ = $1 * $3; }
    | expr '/' expr { if ($3 == 0) { yyerror("Division by zero"); } $$ = $1 / $3; }
    | '(' expr ')'  { $$ = $2; }
    | NUMBER        { $$ = $1; }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    exit(1);
}

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}
