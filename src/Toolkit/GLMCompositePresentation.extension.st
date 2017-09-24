Extension { #name : #GLMCompositePresentation }

{ #category : #'*Toolkit-Glamour' }
GLMCompositePresentation >> defaultRenderer [ 
	^ GLMRenderer renderer
]

{ #category : #'*Toolkit-Glamour' }
GLMCompositePresentation >> initialExtent [
	^ (self presentations collect: #initialExtent) max
]

{ #category : #'*Toolkit-scripting' }
GLMCompositePresentation >> tkActionList [
	^ self custom: TkActionListPresentation new
]

{ #category : #'*Toolkit-scripting' }
GLMCompositePresentation >> tkMagritte [
	^ self custom: TkMagrittePresentation new
]

{ #category : #'*Toolkit-scripting' }
GLMCompositePresentation >> tkMorph [
	^ self custom: TkMorphPresentation new
]

{ #category : #'*Toolkit-Glamour' }
GLMCompositePresentation >> tkOpenOn: anObject [
	^ TkPlatform current openBrowser: self on: anObject
]

{ #category : #'*Toolkit-Glamour-dispatch' }
GLMCompositePresentation >> tkOpenSDL2On: anObject [
	self startOn: anObject.
	^ (self defaultRenderer renderWindow: self) asTkSDL2Window show
]

{ #category : #'*Toolkit-Glamour-dispatch' }
GLMCompositePresentation >> tkOpenWorldOn: anObject [
	^ self openOn: anObject
]

{ #category : #'*Toolkit-Glamour' }
GLMCompositePresentation >> toolbarPosition [
	^ #top asToolbarPosition
]
