accessing
exampleText

	"see RTRoassalExample>>exampleBlinking"

| classes v shape es labels |
"Set here the classes you wish to visualize"
classes := Collection withAllSubclasses.
v := RTView new.
v @ RTDraggableView.
shape := RTBox new
	width: [ :cls | cls numberOfVariables * 5 max: 5 ];
	height: [ :cls | cls numberOfMethods sqrt * 2 ].
es := shape elementsOn: classes.
v addAll: es.
RTFlowLayout on: es.
RTMetricNormalizer new
	elements: es;
	normalizeColor: #numberOfLinesOfCode.

"Set here the classes you wish to visualize"
labels := (RTLabel new height: 8) elementsOn: classes.
RTFlowLayout new
	gapSize: 0;
	on: labels.
v addAll: labels.
RTConstraint move: labels onTheRightOf: es.
labels translateBy: 20 @ 0.
labels @ RTHighlightable.
labels
	when: TRMouseClick
	do: [ :event | 
		RTBlink new
			color: Color blue;
			on: (es elementFromModel: event element model) ].
es @ RTHighlightable.
es
	when: TRMouseClick
	do: [ :event | 
		RTBlink new
			color: Color blue;
			on: (labels elementFromModel: event element model) ].
^ v