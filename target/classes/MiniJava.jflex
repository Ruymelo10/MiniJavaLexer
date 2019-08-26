package br.ufpe.cin.if688.jflex;

%%

/* N�o altere as configura��es a seguir */

%line
%column
%unicode
//%debug
%public
%standalone
%class MiniJava
%eofclose

/* Insira as regras l�xicas abaixo */
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment   = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+"/"
CommentContent   = ( [^*] | \*+ [^/*] )*
letter = [A-Za-z]
digit = [0-9]
integer = 0|[1-9]({digit})*
identifier = ({letter}|_)({letter}|{digit}|_)*
operador = "&&" | "<" | "==" | "!=" | "+" | "-" | "*" | "!"
delimitador = ";" | "." |"," | "=" | "(" | ")" | "{" | "}" | "[" | "]"
whitespace = [ \n\t\r\f]
reservado = "boolean" | "class" | "public" | "extends" | "static" | "void" |
 			"main" | "String" | "int" | "while" | "if" | "else" | "return" | "length" |
 			"true" | "false" | "this" | "new" | "System.out.println" 

%%
{Comment} {}
{integer} {System.out.println("token gerado foi um integer: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{operador} {System.out.println("token gerado foi um operador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{delimitador} {System.out.println("token gerado foi um delimitador: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{reservado} {System.out.println("token gerado foi um reservado: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{identifier} {System.out.println("token gerado foi um id: '"+yytext()+"' na linha: "+yyline+", coluna: "+yycolumn);}
{whitespace} { /* Ignorar whitespace. */ }
    
/* Insira as regras l�xicas no espa�o acima */     
     
. { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }
