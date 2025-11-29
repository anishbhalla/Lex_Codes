/* ------------------------------------------------------------
   Practical 5: Distinguish Language Elements using Lex
   Identifies: Keywords, Identifiers, Numbers, Operators, Comments
   ------------------------------------------------------------ */

%{
#include <stdio.h>
%}

%%

"int"|"float"|"char"|"if"|"else"|"while"|"for"|"return" {
    printf("KEYWORD: %s\n", yytext);
}

[0-9]+\.[0-9]+ {
    printf("FLOAT: %s\n", yytext);
}

[0-9]+ {
    printf("INTEGER: %s\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    printf("IDENTIFIER: %s\n", yytext);
}

"=="|"!="|"<="|">="|"+"|"-"|"*"|"/"|"="|"<"|">" {
    printf("OPERATOR: %s\n", yytext);
}

/\/\/*.* {
    printf("COMMENT (Single-Line): %s\n", yytext);
}

"/*"([^*]|\*+[^*/])*\*+"/" {
    printf("COMMENT (Multi-Line): %s\n", yytext);
}

[ \t\n]         { }    /* Ignore whitespace */

.               { printf("OTHER: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter code:\n");
    yylex();
    return 0;
}
