/* 
 * File:   lexeur.c
 * Author: 3402065
 *
 * Created on 25 février 2015, 11:25
 */

%{

#include <stdio.h>
#include <stdlib.h>

%}
accolade_ouvrante "{"
accolade_fermante "}"
crochet_ouvrant "["
crochet_fermant "]"
chiffes [0-9] 
spec_char ["^" |  "."  |  "["  |  "$"  |  "("  |  ")"  |  "|" | "*"  |  "+"  |  "?"  |  "{"  |  "\"  ]
ord_char [^{spec_char}]
quoted_char ["\^" |  "\."  |  "\["  |  "\$"  |  "\("  |  "\)"  |  "\|" | "\*"  |  "\+"  |  "\?"  |  "\{"  |  "\\"  ]
dup_count {chiffes}


%%

{accolade_fermante} {return (ACCF);}
{accolade_ouvrante} {return (ACCO);}
{crochet_fermant}	{return (CRHO);}
{crochet_ouvrant}	{return (CRHF);}



{quoted_char} 	{return (QUOTED_CHAR);}
{dup_count}		{return (DUPCOUNT);}   
{ord_char} 		{return (ORD_CHAR);}
