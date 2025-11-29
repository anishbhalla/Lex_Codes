/* ------------------------------------------------------------
   Practical 8: Recognize Valid Arithmetic Expression using Lex
   ------------------------------------------------------------ */

%{
#include <stdio.h>
int valid = 1;
%}

%%

[0-9]+                 { printf("NUMBER: %s ", yytext); }

[+\-*/]               { printf("OPERATOR: %s ", yytext); }

[()\[\]{}]           { printf("BRACKET: %s ", yytext); }

[ \t]                { }    /* Ignore spaces and tabs */

\n                   { return 0; }

.                   {
                        printf("\nInvalid character: %s\n", yytext);
                        valid = 0;
                        return 0;
                    }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter an arithmetic expression: ");
    yylex();

    if (valid) {
        printf("\nExpression is valid!\n");
    }

    return 0;
}
