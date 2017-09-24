Class {
	#name : #TkFormRenderer,
	#superclass : #MAVisitor,
	#instVars : [
		'container',
		'morph',
		'model'
	],
	#category : 'Toolkit-Magritte-Renderer'
}

{ #category : #'instance creation' }
TkFormRenderer class >> model: anObject on: aMorph [ 
	^ self new model: anObject on: aMorph
]

{ #category : #accessing }
TkFormRenderer >> memento [
	^ self model memento
]

{ #category : #accessing }
TkFormRenderer >> model [
	^ model
]

{ #category : #accessing }
TkFormRenderer >> model: anObject [
	model := anObject
]

{ #category : #visiting }
TkFormRenderer >> model: anObject on: aMorph [ 
	morph := aMorph.
	model := anObject.
	self visit: anObject magritteDescription
]

{ #category : #accessing }
TkFormRenderer >> morph [
	^ morph
]

{ #category : #accessing }
TkFormRenderer >> morph: aMorph [
	morph := aMorph
]

{ #category : #visiting }
TkFormRenderer >> visitContainer: aDescription [
	(TkFormMorphRenderer description: aDescription model: model on: morph)
		visitor: self;
		render
]

{ #category : #visiting }
TkFormRenderer >> visitMultipleOptionDescription: aDescription [
	(TkMultipleOptionMorphRenderer 
		description: aDescription 
		model: model 
		on: morph) 
		render
]

{ #category : #visiting }
TkFormRenderer >> visitNumberDescription: aDescription [
	(TkNumberMorphRenderer 
		description: aDescription 
		model: model 
		on: morph) 
		render
]

{ #category : #visiting }
TkFormRenderer >> visitSingleOptionDescription: aDescription [
	(TkSingleOptionMorphRenderer 
		description: aDescription 
		model: model 
		on: morph) 
		render
]

{ #category : #visiting }
TkFormRenderer >> visitStringDescription: aDescription [
	(TkStringMorphRenderer 
		description: aDescription 
		model: model 
		on: morph) 
		render
]
