accessing
bareByteArray

	^ super bareByteArray ==> [ :tokens | (tokens second collect: [:n | n value]) asByteArray lit <-> tokens ] 