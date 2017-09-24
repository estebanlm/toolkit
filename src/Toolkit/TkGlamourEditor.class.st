"
I'm a browser (glamour) based generator.
"
Class {
	#name : #TkGlamourEditor,
	#superclass : #TkEditor,
	#instVars : [
		'value',
		'window',
		'acceptIcon',
		'cancelIcon'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #defaults }
TkGlamourEditor class >> defaultAcceptIcon [
	^ Smalltalk ui icons iconNamed: 'smallOk'
]

{ #category : #defaults }
TkGlamourEditor class >> defaultCancelIcon [
	^ Smalltalk ui icons iconNamed: 'smallCancel'
]

{ #category : #accessing }
TkGlamourEditor >> acceptIcon [
	^ acceptIcon ifNil: [ self class defaultAcceptIcon ]
]

{ #category : #accessing }
TkGlamourEditor >> acceptIcon: anObject [
	acceptIcon := anObject
]

{ #category : #building }
TkGlamourEditor >> buildActionsOn: aBrowser [

	aBrowser transmit 
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ self inform: 'Please select one element first!' ] 
					icon: self acceptIcon 
					entitled: 'Accept' ].

	aBrowser transmit 
		from: #objects;
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ :presenter :selection | value := selection. window close ] 
					icon: self acceptIcon
					entitled: 'Accept' ]
]

{ #category : #building }
TkGlamourEditor >> buildBrowser [
	^ self subclassResponsibility
]

{ #category : #accessing }
TkGlamourEditor >> cancelIcon [
	^ cancelIcon ifNil: [ self class defaultCancelIcon ]
]

{ #category : #accessing }
TkGlamourEditor >> cancelIcon: anObject [
	cancelIcon := anObject
]

{ #category : #generating }
TkGlamourEditor >> go [ 
	| browser |

	value := nil.
	browser := self buildBrowser.
	browser initialExtent: (self preferredExtent ifNil: [ browser initialExtent ]).
	browser startOn: self startValue.
	window := TkPlatform current renderBrowser: browser.
	window tkOpenModal.
	
	^ self value
		ifNotNil: [ self createObject ]
]

{ #category : #accessing }
TkGlamourEditor >> startValue [
	^ #()
]

{ #category : #accessing }
TkGlamourEditor >> value [ 
	^ value
]
