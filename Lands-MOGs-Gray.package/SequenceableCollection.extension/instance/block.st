*Lands-MOGs-Gray
block

	|args temps stmts|

	stmts := self stmts sequence.
	args := self 
		select: [ :i | 
			i isOrderedCollection and: [  
				|nodes| 
				nodes := i nodes.  
				nodes ifNotEmpty: [ 
					nodes first isVar or: [ i first isToken and: [ i first string = ':' ] ] ] ifEmpty: [ false ] ] 
			] "ifNone: [#()]".	 
	temps := (self select: [ :i | i isArray ]) deepFlatten select: [:i | i isVar or: [i isToken]].
	
	stmts <-> temps. "if tokens are present, first and last will be the || bars"
	stmts temporaries: (temps select: [ :t | t isToken not ]).
	
	^ RBBlockNode 
		arguments: (args deepFlatten select: [ :a | a isVar ])
		body: stmts.