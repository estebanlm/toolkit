"
I announce when a window will be closed. 
I allow my takers to deny this close (for example, if you want to keep something that is not saved, etc.).
"
Class {
	#name : #WindowWillClose,
	#superclass : #WindowAnnouncement,
	#instVars : [
		'canClose'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #testing }
WindowWillClose >> canClose [
	^ canClose
]

{ #category : #accessing }
WindowWillClose >> denyClose [
	canClose := false
]

{ #category : #initialization }
WindowWillClose >> initialize [ 
	super initialize.
	canClose := true
]
