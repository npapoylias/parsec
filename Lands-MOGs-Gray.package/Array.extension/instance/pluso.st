*Lands-MOGs-Gray
pluso

	"A+ = #(A , A*)"
	
	|name|
	name := ('tp' , self hash asString) asSymbol.
	^  name --|>  self , {name . #/ . #e} . "returns rule"