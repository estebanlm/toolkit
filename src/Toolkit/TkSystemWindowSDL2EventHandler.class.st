Class {
	#name : #TkSystemWindowSDL2EventHandler,
	#superclass : #TkMorphSDL2EventHandler,
	#instVars : [
		'window'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #announcing }
TkSystemWindowSDL2EventHandler >> announce: anAnnouncement [ 
	self announcer announce: anAnnouncement.
]

{ #category : #accessing }
TkSystemWindowSDL2EventHandler >> announcer [ 
	"I use the same announcer as my host window"
	^ self window rootMorph announcer
]

{ #category : #visiting }
TkSystemWindowSDL2EventHandler >> visitWindowFocusInEvent: anEvent [
	window menuList 
		do: [ :each | each close ];
		removeAll
]

{ #category : #visiting }
TkSystemWindowSDL2EventHandler >> visitWindowResizeEvent: anEvent [
	rootMorph extent: window extent.
	"window dragArea right: (morphicWorld width - 50)."
	window forceUpdate.
]

{ #category : #announcing }
TkSystemWindowSDL2EventHandler >> when: anAnnouncement do: aBlock [ 
	self announcer when: anAnnouncement do: aBlock 
]

{ #category : #announcing }
TkSystemWindowSDL2EventHandler >> when: anAnnouncement send: aSelector [ to: aTarger
	self announcer when: anAnnouncement send: aSelector to: aTarger
]

{ #category : #accessing }
TkSystemWindowSDL2EventHandler >> window [
	^ window
]

{ #category : #accessing }
TkSystemWindowSDL2EventHandler >> window: anObject [
	window := anObject
]
