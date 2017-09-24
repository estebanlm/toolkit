"
I'm an abstract class to define a platform to display GUI elementes. 
The idea is to have an strategy with posibilities, so  an user can use OSWindows or the World (or whatever) alternativelly , without polluting applications with ifs.

My children implement platform specific ""open"" methods. 

Default is World (see #useWorld method).
"
Class {
	#name : #TkPlatform,
	#superclass : #Object,
	#classVars : [
		'Current'
	],
	#classInstVars : [
		'uniqueInstance'
	],
	#category : 'Toolkit-Platform'
}

{ #category : #accessing }
TkPlatform class >> current [ 
	^ Current ifNil: [ 
		self useWorld.
		Current ]
]

{ #category : #'instance creation' }
TkPlatform class >> new [
	self error: 'Use #uniqueInstance'
]

{ #category : #'instance creation' }
TkPlatform class >> uniqueInstance [
	self = TkPlatform 
		ifTrue: [ self error: 'I''m abstract. Use one of my children' ].
	^ uniqueInstance ifNil: [ uniqueInstance := self basicNew initialize ]
]

{ #category : #accessing }
TkPlatform class >> useSDL2 [
	Current := TkPlatformSDL2 uniqueInstance
]

{ #category : #accessing }
TkPlatform class >> useWorld [
	Current := TkPlatformWorld uniqueInstance
]

{ #category : #accessing }
TkPlatform >> magritteDefaultContainerClass [
	^ self subclassResponsibility
]

{ #category : #showing }
TkPlatform >> openBrowser: aComposite on: anObject [
	^ self subclassResponsibility
	
]

{ #category : #showing }
TkPlatform >> openMorph: aMorph [
	^ self subclassResponsibility 
]

{ #category : #showing }
TkPlatform >> openMorphModal: aMorph [
	^ self subclassResponsibility 
]

{ #category : #showing }
TkPlatform >> openWindow: aWindow [
	self subclassResponsibility
]

{ #category : #showing }
TkPlatform >> openWindowModal: aWindow [
	self subclassResponsibility
]

{ #category : #rendering }
TkPlatform >> renderBrowser: aRenderable [
	^ aRenderable windowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 
]

{ #category : #rendering }
TkPlatform >> renderMiniBrowser: aRenderable [
	^ aRenderable miniWindowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 
]

{ #category : #rendering }
TkPlatform >> renderTinyBrowser: aRenderable [
	^ aRenderable windowRendererClass 
		render: aRenderable 
		from: aRenderable defaultRenderer 
]
