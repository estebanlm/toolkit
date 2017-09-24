Extension { #name : #Morph }

{ #category : #'*Toolkit-Morphic' }
Morph >> asTkSDL2Window [
	^ TkMorphSDL2Window root: self
]

{ #category : #'*Toolkit-Morphic' }
Morph >> tkOpen [
	^ TkPlatform current openMorph: self 
]

{ #category : #'*Toolkit-Morphic' }
Morph >> tkOpenSDL2 [
	^ self asTkSDL2Window show
]

{ #category : #'*Toolkit-Morphic' }
Morph >> tkOpenWorld [
	^ self openInWorld
]
