Class {
	#name : #TkMenuBuilder,
	#superclass : #Object,
	#instVars : [
		'actions',
		'model'
	],
	#category : 'Toolkit-Glamour-Morphic'
}

{ #category : #accessing }
TkMenuBuilder >> actions [
	^ actions
]

{ #category : #accessing }
TkMenuBuilder >> actions: anObject [
	actions := anObject
]

{ #category : #building }
TkMenuBuilder >> build [
	| menuMorph subMenus targetMenuMorph subMenu menuItem |
	
	menuMorph := MenuMorph new.
	subMenus := Dictionary new.
	self actions do: [ :each |
		targetMenuMorph := each category notNil 
			ifTrue: [ subMenus at: each category ifAbsentPut: [ 
					subMenu :=  MenuMorph new.
					menuMorph add: each category subMenu: subMenu.
					subMenu ] ]
			ifFalse: [ menuMorph ].
		
		menuItem := targetMenuMorph
			add: each title
			target: each 
			selector: #actOn:from:
			argumentList: nil.
		menuItem 
			arguments: { self model. menuItem };
			enabled: (each isEnabledOnModel: self model);
			icon:  each icon;
			keyText: (each hasShortcut 
				ifTrue: [ each shortcutAsString ]
				ifFalse: [ nil ]) ].
			
	^ menuMorph
]

{ #category : #accessing }
TkMenuBuilder >> model [
	^ model
]

{ #category : #accessing }
TkMenuBuilder >> model: anObject [
	model := anObject
]
