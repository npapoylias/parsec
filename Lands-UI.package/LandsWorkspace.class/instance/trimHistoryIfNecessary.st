history
trimHistoryIfNecessary
	(self lastContents size > self historyLength)
		ifTrue: [ LastContents := LastContents copyFrom: 1 to: self historyLength ]