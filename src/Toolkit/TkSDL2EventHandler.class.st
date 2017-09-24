Class {
	#name : #TkSDL2EventHandler,
	#superclass : #OSWindowEventVisitor,
	#instVars : [
		'window',
		'announcer'
	],
	#category : 'Toolkit-SDL2'
}

{ #category : #announcing }
TkSDL2EventHandler >> announce: anAnnouncement [ 
	self announcer announce: anAnnouncement.
]

{ #category : #announcing }
TkSDL2EventHandler >> announcer [ 
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #visiting }
TkSDL2EventHandler >> visitWindowCloseEvent: anEvent [
	anEvent suppressDefaultAction.
	self window close
]

{ #category : #announcing }
TkSDL2EventHandler >> when: anAnnouncement do: aBlock [ 
	self announcer when: anAnnouncement do: aBlock 
]

{ #category : #announcing }
TkSDL2EventHandler >> when: anAnnouncement send: aSelector [ to: aTarger
	self announcer when: anAnnouncement send: aSelector to: aTarger
]

{ #category : #accessing }
TkSDL2EventHandler >> window [
	^ window
]

{ #category : #accessing }
TkSDL2EventHandler >> window: anObject [
	window := anObject
]
