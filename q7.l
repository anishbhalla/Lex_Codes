/* ------------------------------------------------------------
   Practical 7: Generate All Substrings of a Given String Using Lex
   ------------------------------------------------------------ */

%{
#include <stdio.h>
#include <string.h>
%}

%%

.+      {
            int len = strlen(yytext);

            printf("\nSubstrings of '%s':\n\n", yytext);

            for (int i = 0; i < len; i++) {
                for (int j = i; j < len; j++) {
                    for (int k = i; k <= j; k++) {
                        printf("%c", yytext[k]);
                    }
                    printf("\n");
                }
            }
        }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}
