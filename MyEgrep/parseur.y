/* 
 * File:   parseur.c
 * Author: 3402065
 *
 * Created on 25 février 2015, 11:27
 */


%{

#include <stdio.h>
#include <stdlib.h>


%}

%token  ORD_CHAR QUOTED_CHAR DUP_COUNT
%start  extended_reg_exp

%%
/* --------------------------------------------
   Extended Regular Expression
   --------------------------------------------
*/
extended_reg_exp   :                      ERE_branch
                   | extended_reg_exp '|' ERE_branch
                   ;
ERE_branch         :            ERE_expression
                   | ERE_branch ERE_expression
                   ;
ERE_expression     : one_char_or_coll_elem_ERE
                   | '^'
                   | '$'
                   | '(' extended_reg_exp ')'
                   | ERE_expression ERE_dupl_symbol
                   ;
one_char_or_coll_elem_ERE  : ORD_CHAR
                   | QUOTED_CHAR
                   | '.'
                   | bracket_expression
                   ;
ERE_dupl_symbol    : '*'
                   | '+'
                   | '?'
                   | '{' DUP_COUNT               '}'
                   | '{' DUP_COUNT ','           '}'
                   | '{' DUP_COUNT ',' DUP_COUNT '}'
                   ;
//grammaire braket expression


%%



int yyerror(char *s) {
  printf("%s\n",s);
}

int main(void) {
  yyparse();
}
