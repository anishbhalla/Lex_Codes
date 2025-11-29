/* ------------------------------------------------------------
   Practical 9: Lex scanner for validating variable names
   ------------------------------------------------------------ */

%{
#include "q9.tab.h"   /* Include Bison token definitions */
%}

%%

[a-zA-Z]   { return LETTER; }   /* Letters */
[0-9]      { return DIGIT; }    /* Digits */
\n         { return '\n'; }     /* Newline signals end of input */
.          { /* ignore other characters */ }

%%

int yywrap() {
    return 1;
}

/* Example Output:
Enter a variable name (letter followed by digit): a5
Valid variable!
Enter a variable name (letter followed by digit): ab
Invalid variable!
*/