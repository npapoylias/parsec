accessing
ruleExpressions

	^ ruleExpressions --> #(optionOperand '\||/') delimeterStar ==> [ :tokens | 
		(1 to: tokens size by: 2) collect: [ :index | tokens at: index]. "even index are operands" 
	]  "optionOperand , #('\||/' optionOperand) star" 