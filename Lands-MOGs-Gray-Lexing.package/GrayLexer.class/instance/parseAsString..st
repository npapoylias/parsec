parseAsString
parseAsString: aString
	
	|result|
	
	stream := aString readStream.
	result := GrayLexerConcat new.
	result add: self parseStringConcatOp.
	[stream atEnd] 
		whileFalse: [ result add: self parseStringConcatOp. ]. 
	^ result size = 1 ifTrue: [ result first ] ifFalse: [ result ] "flatten"