as yet unclassified
scrollWithAnnouncement: ann
	| selectedTab pager|
	selectedTab := self tabArea innerTabManager selectedTab.
	(pager := (self pagerAtTab: selectedTab)) add: (self inspectorWith: ann result).
	pager owner ~= selectedTab ifTrue: [
		selectedTab model: pager.
		selectedTab spec instance widget refreshContent.
	]	
	