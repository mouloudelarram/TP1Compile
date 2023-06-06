/*
 *
 * mouloud el arram 12210438
 * Aymane BOITI 12211615
 *
 */


%option noyywrap

%{
#include <stdio.h>
int lineNum = 1;
int position = 0;
%}

WORD [a-zA-Z]+

%%

\n {
    lineNum++;
    position = 0;
}

{WORD} {
    position++;
    printf("%d %d %d %s\n", lineNum, position, yyleng, yytext);
}

. ;

%%

int main() {
    yylex();
    return 0;
}
