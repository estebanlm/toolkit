"
I'm a generic editor. 
Editors are the base input mechanism for the application.
I basically display magritte forms or glamour browsers, and I generate objects depending on user input.
"
Class {
	#name : #TkEditor,
	#superclass : #Object,
	#instVars : [
		'parent'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #generating }
TkEditor class >> generateOnParent: aWindow [
	^ self new 
		parent: aWindow;
		go
]

{ #category : #generating }
TkEditor class >> go [
	^ self new go
]

{ #category : #accessing }
TkEditor class >> preferredExtent [
	^ 500@400
]

{ #category : #accessing }
TkEditor class >> title [ 
	^ self name
]

{ #category : #factory }
TkEditor >> createObject [
	^ self subclassResponsibility
]

{ #category : #generating }
TkEditor >> go [ 
	self subclassResponsibility
]

{ #category : #accessing }
TkEditor >> parent [
	^ parent
]

{ #category : #accessing }
TkEditor >> parent: anObject [
	parent := anObject
]

{ #category : #accessing }
TkEditor >> preferredExtent [
	^ self class preferredExtent
]

{ #category : #accessing }
TkEditor >> title [ 
	^ self class title
]
