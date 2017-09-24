"
I define open methods on OSWindow (SDL) platform.
"
Class {
	#name : #TkPlatformSDL2,
	#superclass : #TkPlatform,
	#category : 'Toolkit-Platform'
}

{ #category : #accessing }
TkPlatformSDL2 >> magritteDefaultContainerClass [
	^ MASilentContainerMorph
]

{ #category : #showing }
TkPlatformSDL2 >> openBrowser: aComposite on: anObject [
	^ aComposite tkOpenSDL2On: anObject
]

{ #category : #showing }
TkPlatformSDL2 >> openMorph: aMorph [
	^ aMorph tkOpenSDL2
]

{ #category : #showing }
TkPlatformSDL2 >> openMorphModal: aMorph [
	^ aMorph tkOpenModalSDL2
]

{ #category : #showing }
TkPlatformSDL2 >> openWindow: aWindow [
	^ aWindow tkOpenSDL2
]

{ #category : #showing }
TkPlatformSDL2 >> openWindowModal: aWindow [
	^ aWindow tkOpenModalSDL2 
]

{ #category : #rendering }
TkPlatformSDL2 >> renderBrowser: aRenderable [
	^ aRenderable defaultRenderer renderWindow: aRenderable
]
