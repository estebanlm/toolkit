"
I define open methods to display things in the world.
"
Class {
	#name : #TkPlatformWorld,
	#superclass : #TkPlatform,
	#category : 'Toolkit-Platform'
}

{ #category : #accessing }
TkPlatformWorld >> magritteDefaultContainerClass [
	^ MAContainerMorph
]

{ #category : #showing }
TkPlatformWorld >> openBrowser: aComposite on: anObject [
	^ aComposite openOn: anObject
]

{ #category : #showing }
TkPlatformWorld >> openMorph: aMorph [
	^ aMorph tkOpenWorld
]

{ #category : #showing }
TkPlatformWorld >> openMorphModal: aMorph [
	^ aMorph tkOpenModalWorld
]

{ #category : #showing }
TkPlatformWorld >> openWindow: aWindow [
	^ aWindow tkOpenWorld
]

{ #category : #showing }
TkPlatformWorld >> openWindowModal: aWindow [
	"In world, we ignore parent window"
	^ aWindow tkOpenModalWorld
]

{ #category : #rendering }
TkPlatformWorld >> renderBrowser: aRenderable [
	^ aRenderable defaultRenderer renderWindow: aRenderable
]
