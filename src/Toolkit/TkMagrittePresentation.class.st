"
I define a special kind of magritte presentation (#guiMagritte), who enhances glamour control of magritte presentations.
"
Class {
	#name : #TkMagrittePresentation,
	#superclass : #GLMMagrittePresentation,
	#instVars : [
		'presenter',
		'readOnly',
		'acceptOnChange'
	],
	#category : 'Toolkit-Glamour-Presentation'
}

{ #category : #accessing }
TkMagrittePresentation >> beAcceptOnChange [
	acceptOnChange := true
]

{ #category : #accessing }
TkMagrittePresentation >> beReadOnly [
	readOnly := true
]

{ #category : #initialization }
TkMagrittePresentation >> initialize [
	super initialize.
	readOnly := false.
	acceptOnChange := false
]

{ #category : #testing }
TkMagrittePresentation >> isAcceptOnChange [
	"Indicates whether the form should be accepted on change or when pressing an accept button"
	^ acceptOnChange
]

{ #category : #testing }
TkMagrittePresentation >> isReadOnly [ 
	"Indicates whether the form is readOnly"
	^ readOnly
	
]

{ #category : #accessing }
TkMagrittePresentation >> presenter [
	^ presenter
]

{ #category : #accessing }
TkMagrittePresentation >> presenter: aSymbol [
	presenter := aSymbol
]

{ #category : #rendering }
TkMagrittePresentation >> renderGlamorouslyOn: aRenderer [ 
	^ aRenderer tkRenderMagrittePresentation: self
]
