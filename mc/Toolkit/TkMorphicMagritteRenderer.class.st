"
I render a magritte presentation as defined in TkMagrittePresentation
"
Class {
	#name : #TkMorphicMagritteRenderer,
	#superclass : #GLMMorphicMagritteRenderer,
	#instVars : [
		'presenter',
		'container'
	],
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #rendering }
TkMorphicMagritteRenderer >> actOnPresentationUpdated: ann [
	container removeAllMorphs.
	container 
		addMorph: (self magritteMorphFrom: ann presentation)
		fullFrame: LayoutFrame identity
]

{ #category : #rendering }
TkMorphicMagritteRenderer >> magritteDescriptionFor: anObject presentation: aMagrittePresentation [
	| description |
	
	description := aMagrittePresentation presenter
		ifNotNil: [ :aPresenter | (anObject magritteDescriptionFor: aPresenter) copy ]
		ifNil: [ (aMagrittePresentation magritteDescription glamourValue: anObject) copy ].
	
	"Using MAContainerMorph can raise some problems, as it try to delete morphs after commiting. We don't want this behavior."
	(description morphClass = MAContainerMorph)
		ifTrue: [description morphClass: MASilentContainerMorph]. 
	
	aMagrittePresentation isReadOnly ifTrue: [ 
		description readonly: true.
		description children do: [ :each | each readonly: true ] ].
	
	^ description
]

{ #category : #rendering }
TkMorphicMagritteRenderer >> magritteMorphFrom: aMagrittePresentation [
	| toShow description magritteDescriptionMorph |
	toShow := aMagrittePresentation displayValue.
	description := self magritteDescriptionFor: toShow presentation: aMagrittePresentation.
		
	magritteDescriptionMorph :=  (description asMorphOn: toShow)
		onAnswer: [ :value | aMagrittePresentation reactOnAnswerFor: value ].
	(aMagrittePresentation isReadOnly or: [ aMagrittePresentation isAcceptOnChange ]) 
		ifFalse: [ magritteDescriptionMorph tkAddButtons ].
	
	^ magritteDescriptionMorph morph
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		layoutChanged;
		yourself
]

{ #category : #rendering }
TkMorphicMagritteRenderer >> render: aMagrittePresentation [
	container := GLMMorphic containerMorph.
	container 
		addMorph: (self magritteMorphFrom: aMagrittePresentation) 
		fullFrame: LayoutFrame identity.
	
	aMagrittePresentation 
		when: GLMPresentationUpdated 
		send: #actOnPresentationUpdated: 
		to: self.
	
	^ container
]
