tests
testBenchStringNFA

	| oldLex newLex result |
	oldLex := '"(\\[\\/"bfnrt]|\\u[0-9a-fA-F]{4}|[^\\"])*"' asGrayRegex.
	newLex := '"(\\[\\/"bfnrt]|\\u[0-9a-fA-F]{4}|[^\\"])*"' asGrayRegex asNFA.
	result := [1 to: 50000 do: [:i | oldLex matchesStreamPrefix: '"hallo world\n"' readStream]] timeToRun asNanoSeconds asFloat /
	[1 to: 50000 do: [:i | newLex matchesStreamPrefix: '"hallo world\n"' readStream]] timeToRun asNanoSeconds asFloat.
	Transcript show: result; cr.