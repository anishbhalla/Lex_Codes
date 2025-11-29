%{ 
#include "y.tab.h" 
#include <stdlib.h>
%}

%%

[0-9]+     { yylval = atoi(yytext); return NUMBER; }
[+\-*/()]  { return yytext[0]; }
\n         { return '\n'; }
[ \t]      { }
.          { }

%%

int yywrap() {
    return 1;
}

/* Example Output:
Enter an expression: (10 + 20) * 2 - 5
Result: 55
*/
