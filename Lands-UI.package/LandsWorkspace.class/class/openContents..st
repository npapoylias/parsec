instance creation
openContents: aString
	"Open a new workspace with the given contents. aString has to be Smalltalk code. The style is applied"
	
	^ self new
		open;
	 	contents: aString;
		changed: #contents;
		yourself