"
I'm a magritte based generator.
"
Class {
	#name : #TkMagritteEditor,
	#superclass : #TkEditor,
	#instVars : [
		'object',
		'description',
		'title'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #'instance creation' }
TkMagritteEditor class >> new [
	self error: 'Use #object:description:'
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject [
	^ self 
		object: anObject 
		description: anObject magritteDescription
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject description: aDescription [ 
	^ self 
		object: anObject 
		description: aDescription 
		title: nil
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject description: aDescription title: aString [ 
	^ self basicNew 
		initializeObject: anObject 
			description: aDescription 
			title: aString;
		yourself
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject presenter: aSymbol [
	^ self 
		object: anObject 
		presenter: aSymbol 
		title: nil
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject presenter: aSymbol title: aString [
	^ self 
		object: anObject 
		description: (anObject magritteDescriptionFor: aSymbol)
		title: aString
]

{ #category : #'instance creation' }
TkMagritteEditor class >> object: anObject title: aString [
	^ self 
		object: anObject 
		description: anObject magritteDescription
		title: aString
]

{ #category : #private }
TkMagritteEditor >> asMagritteMorph [ 
	^ self description asMorphOn: self object
]

{ #category : #private }
TkMagritteEditor >> calculateHeight [
	"
	110=extras (title bar, button bar)
	"
	^ self description tkHeight + 110
]

{ #category : #factory }
TkMagritteEditor >> createObject [ 
	"Do not create, answer the passed object"
	^ self object
]

{ #category : #accessing }
TkMagritteEditor >> description [
	^ description
]

{ #category : #generating }
TkMagritteEditor >> go [ 
	| result |
	
	result := self asMagritteMorph 
		tkAddButtons;
		addWindowWithTitle: self title extent: self preferredExtent;
		tkOpenModal.
	^ result ifNotNil: [ self createObject ] 
			
]

{ #category : #initialization }
TkMagritteEditor >> initializeObject: anObject description: aDescription title: aString [
	object := anObject.
	description := aDescription.
	title := aString.
	self initialize
]

{ #category : #accessing }
TkMagritteEditor >> object [ 
	^ object
]

{ #category : #accessing }
TkMagritteEditor >> preferredExtent [
	^ super preferredExtent x @ (self calculateHeight)
]

{ #category : #accessing }
TkMagritteEditor >> title [
	^ title ifNil: [ 
		self description 
			propertyAt: #tkGeneratorLabel 
			ifAbsent: [ self description label ] ]
]
