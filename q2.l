/*Practical 2: Count Vowels and Consonants in a String*/

%{
#include <stdio.h>

int vowel_count = 0;
int consonant_count = 0;
%}

%%
[aeiouAEIOU]     { vowel_count++; }
[a-zA-Z]        { consonant_count++; }
.               { }   /* Ignore non-alphabet characters */
\n              { }   /* Ignore newline */
%%

int yywrap() {
    return 1;
}

int main() {
    printf("Enter a string: ");
    yylex();
    printf("\nNumber of vowels: %d\n", vowel_count);
    printf("Number of consonants: %d\n", consonant_count);
    return 0;
}
