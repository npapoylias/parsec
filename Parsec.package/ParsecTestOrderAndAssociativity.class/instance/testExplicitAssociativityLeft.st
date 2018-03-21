tests
testExplicitAssociativityLeft

	grammar := ParsecGrammar new
		named: #ExpressionGrammar;
		with: { 
		'<start> ::= <expression>'.
		'<expression> ::=  "(" <expression> ")"
			| <expression> "+" <expression> 
			| <expression> "-" <expression>
			| <expression> "*" <expression>
			| <expression> "/" <expression>
			| <expression> "^" <expression> 
			| <expression> "^" <expression> & "^"
			/ ''[0-9]+(\.[0-9]+)?''
		' ==> { 
			[ :tokens | tokens second ].
			[ :tokens | tokens first + tokens last ].
			[ :tokens | tokens first - tokens last ].
			[ :tokens | tokens first * tokens last ].
			[ :tokens | tokens first / tokens last ].
			[ :tokens | tokens first raisedTo: tokens last ].
			[ :tokens | tokens first raisedTo: tokens last ].
			[ :token  | token tokenValue asNumber ].
		}
	}.

	results := grammar parse: '2^3^4'. "parse-logging take a lot of time here"

	self assert: results trees size = 1.
	
	self assert: results results first value = 4096.
	