tests
testArithmeticViaSymbolPerform

	self assert: (:'+ 2 2) = 4.
	self assert: (:'+ (* 2 100) (* 1 10)) = 210.