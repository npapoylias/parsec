tests
testExpression
	|results|

	results := CalcEvaluator new parse: 'x=1*2+3 y=2*x'.

	self assert: results trees size = 2.
	self assert: results results first value = ({#x-> 5 . #y-> 10} asDictionary -> {5. 10} asOrderedCollection)