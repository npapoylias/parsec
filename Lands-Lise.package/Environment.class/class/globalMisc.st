as yet unclassified
globalMisc

		"check semanticts for in-place additons etc"
		  |primitives|
	     primitives := {
		  #true -> true.
		  #false -> false.
		  #append -> [ :l | (l first copy) 
										addAll: l second asOrderedCollection; 
										yourself ] " op.add " .  
        #apply ->  [:l | l first apply: l second]. "  apply " .
        "#begin ->  [:l | l last]" "  lambda *x: x[-1] " .
        #car -> [:l | l first first] "    lambda x: x[0] " .
        #cdr -> [:l | l first allButFirst] "    lambda x: x[1:] " . 
        #cons -> [:l | {l first} asOrderedCollection addAll: l second asOrderedCollection; yourself] "   lambda x,y: [x] + y " .
        #'eq?' -> #== "    op.is_ " . 
        #'equal?' -> #= " op.eq " . 
        #length -> #size " len " . 
        #list -> [:l | l ] "   lambda *x: list(x) " . 
        #'list?' -> #isArray "  lambda x: isinstance(x,list) " . 
        #map -> [:l | l second collect: [:litem | l first apply: litem]] "    map " .
        #max -> #max "    max " .
        #min -> #min "    min " .
		  #floor -> #floor.
		  #ceiling -> #ceiling.
        #not -> #not "    op.not_ " .
        #'null' -> #isEmpty "  lambda x: x == [] " . 
        #'number?' -> #isNumber "lambda x: isinstance(x,Number) " .   
        #'procedure?' -> [:l | l first isKindOf: Procedure] "callable " .
        #round -> #rounded "  round " .
        #'symbol?' -> #isSymbol "lambda x: isinstance(x,Symbol) " .
        #print -> [:l | l do: [:litem | Transcript show: litem]] "fix this -- lambda x: scm_print(x)".	  
		  #dict -> [:l | 
				|d|
				d := Dictionary new.
				l do: [ :litem | "tuple list" 
					d at: litem first put: litem second.	
				].
				d
			].
		  #atPut -> #at:put:.
		  #at -> #at:.
		  #addFirst -> #addFirst:.
		  #addLast -> #addLast:.
		  #do -> [:l | l first do: [:litem |
				l second apply: litem	
			]]."different depending if this is list or dict"
		  #doWithIndex -> [:l | l first doWithIndex: [:litem :index |
				l second apply: { litem . index }	
			]].
		  #keysAndValuesDo -> [:l | l first keysAndValuesDo: [:key :value |
				l second apply: { key . value }	
			]].
		  #select -> [:l | l first select: [:litem | l second apply: litem]].
		  #collect -> [:l | l first collect: [:litem | l second apply: litem]].
		  #parse -> [ :l | LiseInterpreter parse: l first ].
		  #eval -> [ :l | LiseInterpreter eval: l first ].
		  #parseval -> [ :l | LiseInterpreter eval: (LiseInterpreter parse: l first) ].
			} asDictionary.
		 
		  ^ primitives keys -> (primitives values collect: [:value |  
				value isSymbol 
					ifTrue: [ PrimitiveProcedure new withSymbol: value ]
					ifFalse: [ value isBlock
										ifTrue: [ PrimitiveProcedure new withBlock: value ]
										ifFalse: [ value ]
					]
			])
