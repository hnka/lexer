package com.hnka;
import java_cup.sym;

%%

/* JFLEX DEFINITIONS */

%line
%column
%cup
%unicode
%standalone
%class MiniJavaLexer

%{
String reservedWordMessage = "Reserved Word Token [ ";
String operatorMessage = "Operator Token [ ";
String delimiterMessage = "Delimiter or Punctuation Token [ ";
String identifierMessage = "Identifier Token [ ";
String literalIntegerMessage = "Literal Integer Token [ ";
String defaultMessage = "Token [ ";
String closingBrackets = " ]";

public void reachedPrintableToken (String token, String type) {
 switch (type) {
    case "reservedWord":
        System.out.println(reservedWordMessage + token + closingBrackets);
        break;
    case "operator":
        System.out.println(operatorMessage + token + closingBrackets);
        break;
    case "delimiter":
        System.out.println(delimiterMessage + token + closingBrackets);
        break;
    case "identifier":
        System.out.println(identifierMessage + token + closingBrackets);
        break;
    case "literalInteger":
        System.out.println(literalIntegerMessage + token + closingBrackets);
        break;
    default:
        System.out.println(defaultMessage + token + closingBrackets);
 }
}
%}

/* PATTERNS */

lineTerminator = \r|\n|\r\n
whiteSpace = {lineTerminator}|[ \t\f]

inlineComment = "//" ~{lineTerminator}
multipleLinesComment = "/*" ~"*/"
comment = {inlineComment}|{multipleLinesComment}

reservedWords = "boolean"|"class"|"public"|"extends"|"static"|"void"|"main"|"String"|"int"|"while"|"if"|"else"|"return"|"length"|"true"|"false"|"this"|"new"|"System.out.println"
operators = "&&"|"<"|"=="|"!="|"+"|"-"|"*"|"!"
delimiters = ";"|"."|","|"="|"("|")"|"{"|"}"|"["|"]"

letter = [A-Za-z]
digit = [0-9]
zero = [0]
notZeroDigit = [1-9]
underline = [_]
customAlphanumeric = {letter}|{digit}|{underline}
firstIdentifier = {underline}|{letter}
identifiers = {firstIdentifier}({customAlphanumeric})*

integer = {digit}*
literalInteger = ({notZeroDigit}{integer})|{zero}

%%

/* RULES */

{reservedWords} { reachedPrintableToken(yytext(), "reservedWord"); }
{operators} { reachedPrintableToken(yytext(), "operator"); }
{delimiters} { reachedPrintableToken(yytext(), "delimiter"); }
{identifiers} { reachedPrintableToken(yytext(), "identifier"); }
{literalInteger} { reachedPrintableToken(yytext(), "literalInteger"); }
{comment} { /* do nothing */ }
{whiteSpace} { /* do nothing */ }
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }