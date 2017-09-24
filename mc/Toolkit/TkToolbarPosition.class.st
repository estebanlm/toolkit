Class {
	#name : #TkToolbarPosition,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #accessing }
TkToolbarPosition class >> fromSymbol: aSymbol [
	^ (self allSubclasses
		detect: [ :each | each kind = aSymbol ])
		uniqueInstance
]

{ #category : #accessing }
TkToolbarPosition class >> kind [
	^ self subclassResponsibility
]

{ #category : #accessing }
TkToolbarPosition class >> left [
	^ TkToolbarPositionTop uniqueInstance
]

{ #category : #'instance creation' }
TkToolbarPosition class >> new [
	^ self error: 'Use #uniqueInstance'
]

{ #category : #accessing }
TkToolbarPosition class >> top [ 
	^ TkToolbarPositionTop uniqueInstance
]

{ #category : #'instance creation' }
TkToolbarPosition class >> uniqueInstance [
	self = TkToolbarPosition 
		ifTrue: [ self error: 'I''m an abstract class, use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #'configuring morphs' }
TkToolbarPosition >> addToolbar: toolbarMorph size: anInteger [ to: aMorph
	"Places a toolbar into a aMorph. 
	 Answers the offset position to place content element"
	self subclassResponsibility
]

{ #category : #converting }
TkToolbarPosition >> asToolbarPosition [
	^ self
]

{ #category : #'configuring morphs' }
TkToolbarPosition >> configureToolbar: aMorph [
	self subclassResponsibility
]

{ #category : #accessing }
TkToolbarPosition >> kind [
	^ self class kind
]
