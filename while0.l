/*
 *
 * mouloud el arram 12210438
 * Aymane BOITI 12211615
 *
 */

%option noyywrap

%{
#include "tokens.h"
%}

%%

[ \t\n]+  /* ignore whitespace */

"while"        { return WHILE; }
"if"           { return IF; }
"then"         { return THEN; }
"else"         { return ELSE; }
"skip"         { return SKIP; }
"true"         { return TRUE; }
"false"        { return FALSE; }
"not"          { return NOT; }
"and"          { return AND; }
"or"           { return OR; }
"="            { return EQUAL; }
"!="           { return NOT_EQUAL; }
"<"            { return LESS_THAN; }
">"            { return GREATER_THAN; }
"<="           { return LESS_THAN_EQUAL; }
">="           { return GREATER_THAN_EQUAL; }
"+"            { return PLUS; }
"-"            { return MINUS; }
"*"            { return MULTIPLY; }
"/"            { return DIVIDE; }
"%"            { return MODULO; }
"("            { return LPAREN; }
")"            { return RPAREN; }
";"            { return SEMICOLON; }
":="           { return ASSIGN; }
[a-zA-Z][a-zA-Z0-9]*  { return IDENTIFIER; }
[0-9]+         { return INTEGER; }

.              { /* ignore unrecognized characters */ }

%%

int main() {
    int token;
    while ((token = yylex()) != 0) {
        printf("Token: %d\n", token);
    }
    return 0;
}
