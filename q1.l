/*Practical 1: Count Lines and Characters in Input File*/

%{
#include <stdio.h>

int line_count = 0;
int char_count = 0;
%}

%%
\n     { line_count++; char_count++; }
.      { char_count++; }
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (Ctrl+Z to end on Windows, Ctrl+D on Unix):\n");
    yylex();

    printf("\nNumber of lines: %d\n", line_count);
    printf("Number of characters: %d\n", char_count);

    return 0;
}
