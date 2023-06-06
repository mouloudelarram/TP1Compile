/*
 *
 * mouloud el arram 12210438
 * Aymane BOITI 12211615
 *
 */


%{
#include <stdio.h>
#include "tokens.h"

int yylex();
void yyerror(const char* message);

%}

%token WHILE IF THEN ELSE SKIP TRUE FALSE NOT AND OR
%token EQUAL NOT_EQUAL LESS_THAN GREATER_THAN LESS_THAN_EQUAL GREATER_THAN_EQUAL
%token PLUS MINUS MULTIPLY DIVIDE MODULO LPAREN RPAREN SEMICOLON ASSIGN DO
%token IDENTIFIER INTEGER


%left PLUS MINUS
%left MULTIPLY DIVIDE MODULO
%nonassoc UMINUS

%%

program : statement
        | program statement
        ;

statement : expression SEMICOLON
          | assignment SEMICOLON
          | conditional_statement
          | while_loop
          | SKIP SEMICOLON
          ;

expression : INTEGER
           | IDENTIFIER
           | TRUE
           | FALSE
           | expression PLUS expression
           | expression MINUS expression
           | expression MULTIPLY expression
           | expression DIVIDE expression
           | expression MODULO expression
           | expression EQUAL expression
           | expression NOT_EQUAL expression
           | expression LESS_THAN expression
           | expression GREATER_THAN expression
           | expression LESS_THAN_EQUAL expression
           | expression GREATER_THAN_EQUAL expression
           | LPAREN expression RPAREN
           | MINUS expression %prec UMINUS
           | NOT expression
           | expression AND expression
           | expression OR expression
           ;

assignment : IDENTIFIER ASSIGN expression
           ;

conditional_statement : IF expression THEN program ELSE program
                      ;

while_loop : WHILE expression DO program
           ;

%%

void yyerror(const char* message) {
    printf("Error: %s\n", message);
}

int main() {
    return yyparse();
}
