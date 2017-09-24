Class {
	#name : #TkMiniWindowRenderer,
	#superclass : #TkSystemWindowRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #private }
TkMiniWindowRenderer >> collectActionsFor: aPresentation [
	^ aPresentation allActions
	 "collect: [ :each | 
		each icon 
			ifNotNil: [ 
				each copy 
					icon: (each icon scaledToSize: 10@10);
					yourself ]
			ifNil: [ 
				each ] ]"
]

{ #category : #rendering }
TkMiniWindowRenderer >> newSystemWindow: aRenderable [
	| newWindow |
	newWindow := TkMiniWindow new model: aRenderable.
	newWindow 
		on: #keyStroke 
		send: #handleKeyStroke: 
		to: newWindow.
	^ newWindow
]

{ #category : #private }
TkMiniWindowRenderer >> toolbarSize [
	^ 12
]
