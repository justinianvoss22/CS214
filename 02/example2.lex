%{
#include <stdio.h>
%}

%%
[0123456789_]+           printf("NUMBER\n");
[a-zA-Z_][a-zA-Z0-9_]*    printf("WORD\n");
%%