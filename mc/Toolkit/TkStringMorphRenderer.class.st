Class {
	#name : #TkStringMorphRenderer,
	#superclass : #TkMorphRenderer,
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #'private factory' }
TkStringMorphRenderer >> createContainerMorphForText: aTextMorph [
	"Since twity does not includes any 'frame' for their elements, I need to wrap them into a 
	 morph who does the job."
	^ TkTextFieldContainerMorph textMorph: aTextMorph
]

{ #category : #'private factory' }
TkStringMorphRenderer >> createTextMorph [
	^ TwyTextMorph new
		beEditable;
		height: self class rowHeight;
		in: [ :this |  	
			(this ensureTool: TwyEditorTool) defaultTextColor: Smalltalk ui theme textColor ];
		yourself.

]

{ #category : #rendering }
TkStringMorphRenderer >> renderEditor [
	morph addMorphBack: (self createContainerMorphForText: (self createTextMorph 
		newTextContents: self model string;
		yourself))	
]
