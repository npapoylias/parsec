compiling
methodSignatureRegExpr
	"binaryCharacter ::=
			'!' | '%' | '&' | '*' | '+' | ','' | '/' | '<' | '=' | '>' | '?' | '@' | '\' | '~' | '|' | '-'
		binarySelector ::= binaryCharacter+"
	^ '[a-zA-Z0-9]+' asParsecRegex asDFA