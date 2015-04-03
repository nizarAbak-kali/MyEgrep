%{
#include <iostream>
#include "parseur.tab.h" 
#define YY_DECL extern "C" int yylex()
%}

accolade_ouvrante "{"
accolade_fermante "}"
crochet_ouvrant "["
crochet_fermant "]"
chiffes [0-9] 
SPEC_CHAR ["^" |  "."  |  "["  |  "$"  |  "("  |  ")"  |  "|" | "*"  |  "+"  |  "?"  |  "{"  |  "\"  ]
ORD_CHAR [^{SPEC_CHAR}]
QUOTED_CHAR ["\^" |  "\."  |  "\["  |  "\$"  |  "\("  |  "\)"  |  "\|" | "\*"  |  "\+"  |  "\?"  |  "\{"  |  "\\"  ]
DUPCOUNT {chiffes}

%%
{accolade_fermante} 	{return (ACCF);}
{accolade_ouvrante} 	{return (ACCO);}
{crochet_fermant}	{return (CRHO);}
{crochet_ouvrant}	{return (CRHF);}



{SPEC_CHAR}		{return (SPEC_CHAR)}
{QUOTED_CHAR} 		{return (QUOTED_CHAR);}
{DUPCOUNT}		{return (DUPCOUNT);}   
{ORD_CHAR} 		{return (ORD_CHAR);}

 
%%

int main(void) {
    yylex();
    return 0;
}
