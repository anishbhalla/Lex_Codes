/* -----------------------------------------------------------
   Practical 4: Find the Longest Word in a Given Input using Lex
   ----------------------------------------------------------- */

%{
#include <stdio.h>
#include <string.h>

char longest[1000] = "";
int max_length = 0;
%}

%%

[a-zA-Z]+   {
                if (strlen(yytext) > max_length) {
                    max_length = strlen(yytext);
                    strcpy(longest, yytext);
                }
            }

.           { }   /* Ignore non-letter characters */

\n          { }   /* Ignore newline */

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text: ");
    yylex();

    printf("\nLongest word: %s\n", longest);
    printf("Length: %d\n", max_length);

    return 0;
}
