%{ 
#include "y.tab.h" 
%}

%%

"a"   { return A; }
"b"   { return B; }
\n    { return '\n'; }
.     { }

%%

int yywrap() {
    return 1;
}

/* Example Output:
Enter a string: aaaaaaaaaab
Valid string! Input belongs to language (a^n b, n>=10)
Enter a string: aaaaab
Invalid string! Does not belong to language (a^n b, n>=10)
*/
