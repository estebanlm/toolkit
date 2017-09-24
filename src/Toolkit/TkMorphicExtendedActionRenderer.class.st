"
I render an extended action. 
Basically is the same as an action, but they will receive also the button who is calling them (to allow transformations, etc.)
"
Class {
	#name : #TkMorphicExtendedActionRenderer,
	#superclass : #GLMMorphicActionRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #accessing }
TkMorphicExtendedActionRenderer >> actionArguments [
	^ nil
]

{ #category : #accessing }
TkMorphicExtendedActionRenderer >> actionSelector [
	^ #actOn:from:
]
