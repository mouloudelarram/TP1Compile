/*
 *  wc.l
 *
 *  Stefano Guerrini
 *  23/03/2012
 */

/*
 *
 * mouloud el arram 12210438
 *
 *
 */

 
%option noyywrap

%{
    #include <stdio.h>

	/* counters */
	int nchars = 0;
	int nwords = 0;
	int nlines = 0;
	int lineNum = 1;
	int flag = 1;
%}

	/* newline */
NL	\n
	/* non-whitespace */
NWS	[^ \t\n]

%%

	/* newline: increase chars, lines, and print line number */
{NL}		{
		if (flag) {
			printf("%d", lineNum);
		}
		printf("\n");
		flag = 1;
		lineNum++;
		nlines++;
		nchars++;
	}

	/* word (a maximal sequence of non-whitespaces):
	 add the length of the word to chars and increase words */
{NWS}+		{
		if (flag) {
			printf("%d ", lineNum);
			flag = 0;
		}
		printf("%s ", yytext);
		nchars += yyleng;
		nwords++;
	}

	/* whitespace: increase chars */
.         nchars++;

<<EOF>>   {
            printf("\n");
            return 0;
          }

%%

int main(int argc, char *argv[]) {
	/* start scanner */
	while (yylex() == 1);
	/* print results */
	printf("%8d%8d%8d\n", nlines, nwords, nchars);
  return 0;
}
