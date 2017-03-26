%%

/* JFLEX DEFINITIONS */

%line
%column
%cup
%unicode
%standalone
%class MiniJavaLexer

%{
String reservedWordMessage = "Reached a reserved word ";
String operatorMessage = "Operator Token ";
String delimiterMessage = "Delimiter or Punctuation Token ";
String identifierMessage = "Identifier Token ";
String literalIntegerMessage = "Literal Integer Token ";
String defaultMessage = "Token ";

public void reachedPrintableToken (String token, String type) {
 switch (type) {
    case "reservedWord":
        System.out.println(reservedWordMessage + token);
        break;
    case "operator":
        System.out.println(operatorMessage + token);
        break;
    case "delimiter":
        System.out.println(delimiterMessage + token);
        break;
    case "identifier":
        System.out.println(identifierMessage + token);
        break;
    case "literalInteger":
        System.out.println(literalIntegerMessage + token);
        break;
    default:
        System.out.println(defaultMessage + token);
 }
}
%}

/* PATTERNS */

lineTerminator = \r|\n|\r\n
inputCharacter = [^\r\n]
whiteSpace = {lineTerminator} | [ \t\f]

inlineComment = "//" {inputCharacter}* ~{lineTerminator}?
multipleLinesComment = "/*" ~"*/"
comment = {inlineComment} | {multipleLinesComment}

reservedWords = "boolean" | "class" | "public" | "extends" | "static" | "void" | "main" | "String" | "int" | "while" | "if" | "else" | "return" | "length" | "true" | "false" | "this" | "new" | "System.out.println"
operators = "&&" | "<" | "==" | "!=" | "+" | "-" | "*" | "!"
delimiters = ";" | "." | "," | "=" | "(" | ")" | "{" | "}" | "[" | "]"

letter = [A-Za-z]
digit = [0-9]
notZeroDigit = [1-9]
underline = [_]
customAlphanumeric = {letter}|{digit}|{underline}
firstIdentifier = {underline} | {letter}
identifiers = {firstIdentifier}({customAlphanumeric})*

integer = {digit}*
literalInteger = {notZeroDigit}({integer})

//treat reserved words identifiers?

%%

/* RULES */

{reservedWords} { reachedPrintableToken(yytext(), "reservedWord"); }
{operators} { reachedPrintableToken(yytext(), "operator"); }
{delimiters} { reachedPrintableToken(yytext(), "delimeter"); }
{identifiers} { reachedPrintableToken(yytext(), "identifier"); }
{literalInteger} { reachedPrintableToken(yytext(), "literalInteger"); }
{comment} { /* do nothing */ }
{whiteSpace} { /* do nothing */ }
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }