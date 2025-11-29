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
Enter a string (a's followed by b's): aabb
Valid string of the language a^n b^n (n>=1)!
Enter a string (a's followed by b's): aabbb
Invalid string! Not in language a^n b^n (n>=1)
*/
