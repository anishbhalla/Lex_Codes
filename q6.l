/* ------------------------------------------------------------
   Practical 6: Count Words, Characters, Blank Spaces, and Lines
   ------------------------------------------------------------ */

%{
#include <stdio.h>
#include <string.h>

int word_count = 0;
int char_count = 0;
int space_count = 0;
int line_count = 0;
%}

%%

[a-zA-Z0-9_]+   {
                    word_count++;
                    char_count += strlen(yytext);
                }

[ \t]           {
                    space_count++;
                    char_count++;
                }

\n              {
                    line_count++;
                    char_count++;
                }

.               {
                    char_count++;
                }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text (press Ctrl+Z then Enter to stop input):\n");
    yylex();

    printf("\nWords: %d\n", word_count);
    printf("Characters: %d\n", char_count);
    printf("Blank spaces: %d\n", space_count);
    printf("Lines: %d\n", line_count);

    return 0;
}
