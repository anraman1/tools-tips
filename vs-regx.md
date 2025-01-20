## To search Ditigt d+
## To Search String s+

This regx search and replace content 

example 01:


port: 8080  ## port number can be anything
port: 8081
port: 443

example: 02

Search digit starting with 4


// $ will return 3 occurrence  ## capture Groups

$0 420
$1 20
$2 0

My line: 420
this My line: 4201



\d	Matches any digit (0-9).
\D	Matches any non-digit character.
\w	Matches any word character (letters, digits, underscores).
\W	Matches any non-word character.
\s	Matches any whitespace character (space, tab, newline).
\S	Matches any non-whitespace character.
\b	Matches a word boundary.
\n	Matches a newline.
\t	Matches a tab.

forward_port: $1
ports: $1