initialization
beNot
	char == nil ifFalse: [ 
		|n|
		n := GrayNFANodeNot new.
		self become: n. 		
		self of: n. "magic"
	] "do not negate epsilons"
	