/*  -----------------------------------------------------------
    Practical 3: Caesar Cipher Implementation using Lex
    Function: Encrypts alphabets using Caesar Cipher (Shift 3)
    ----------------------------------------------------------- */

%{
#include <stdio.h>
%}

%%

[a-zA-Z]   {
                char c = yytext[0];

                // For lowercase letters
                if (c >= 'a' && c <= 'z') {
                    c = ((c - 'a' + 3) % 26) + 'a';
                }
                // For uppercase letters
                else if (c >= 'A' && c <= 'Z') {
                    c = ((c - 'A' + 3) % 26) + 'A';
                }

                printf("%c", c);
           }

.          { printf("%s", yytext); }     /* Print non-alphabet characters unchanged */

\n         { printf("\n"); }

%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter text to encrypt with Caesar cipher (Shift = 3):\n");
    yylex();
    return 0;
}
