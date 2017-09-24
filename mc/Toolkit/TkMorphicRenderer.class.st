"
I define rendering extensions for the client.
"
Class {
	#name : #TkMorphicRenderer,
	#superclass : #GLMMorphicRenderer,
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #opening }
TkMorphicRenderer >> open: aRenderable [
	window := self renderWindow: aRenderable.
	^ window openInWorld
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> refreshWindow: aRenderable window: aWindow [ 
	^ aRenderable windowRendererClass
		refresh: aRenderable 
		window: aWindow
		from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> renderAction: anAction [
	^ TkMorphicActionRenderer render: anAction from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> renderExtendedAction: anAction [
	^ TkMorphicExtendedActionRenderer render: anAction from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> renderWindow: aRenderable [ 
	^ aRenderable windowRendererClass
		render: aRenderable 
		from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> tkRenderActionListPresentation: anActionListPresentation [  
	^ TkMorphicActionListRenderer render: anActionListPresentation from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> tkRenderMagrittePresentation: aMagrittePresentation [ 
	^ TkMorphicMagritteRenderer render: aMagrittePresentation from: self
]

{ #category : #'rendering actions' }
TkMorphicRenderer >> tkRenderMorphPresentation: anActionListPresentation [  
	^ TkMorphicMorphRenderer render: anActionListPresentation from: self
]
