"
I define a special kind of action list presentation suited for GUI applications.
"
Class {
	#name : #TkActionListPresentation,
	#superclass : #GLMActionListPresentation,
	#category : 'Toolkit-Glamour-Presentation'
}

{ #category : #rendering }
TkActionListPresentation >> renderGlamorouslyOn: aRenderer [
	self registerAnnouncements.
	^ aRenderer tkRenderActionListPresentation: self
]
