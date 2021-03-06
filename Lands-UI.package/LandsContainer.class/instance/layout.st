instance creation
layout

	| col |
	col := self layoutClass composed.
	1 to: containedWidgets size do: [ :i | 
		| id resolvedWidget| id := ('id_',i asString) asSymbol.
		resolvedWidget := containedWidgets at: i.
		((resolvedWidget isKindOf: ComposableModel) or: [ resolvedWidget isKindOf: MorphicGenericAdapter ])
			ifFalse: [ resolvedWidget := resolvedWidget ui ]. "fluid container api"
		"self assign: resolvedWidget to: id."
		col add: id.
		col addSplitter.
	].
	"self layout:" ^ col.