"
I'm a simple model to keep selection status. 

I'm used in multiple selection lists.
"
Class {
	#name : #TkSelectingModel,
	#superclass : #Object,
	#instVars : [
		'owner',
		'object'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #'instance creation' }
TkSelectingModel class >> new [
	self error: 'Use #owner:object:'
]

{ #category : #'instance creation' }
TkSelectingModel class >> owner: ownerObject object: anObject [
	^ self basicNew 
		initializeOwner: ownerObject object: anObject;
		yourself
]

{ #category : #initialization }
TkSelectingModel >> initializeOwner: ownerObject object: anObject [
	owner := ownerObject.
	object := anObject.
	self initialize
]

{ #category : #accessing }
TkSelectingModel >> object [
	^ object
]

{ #category : #accessing }
TkSelectingModel >> owner [
	^ owner
]

{ #category : #accessing }
TkSelectingModel >> state [
	^ self owner isSelected: self object
]

{ #category : #accessing }
TkSelectingModel >> state: aBoolean [
	aBoolean 
		ifTrue: [ self owner select: self object ]
		ifFalse: [ self owner removeSelection: self object  ]

]
