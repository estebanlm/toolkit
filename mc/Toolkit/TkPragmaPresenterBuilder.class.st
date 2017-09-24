"
I'm a pragma builder by presenter.
I build magritte descriptions filtered by <presenters> pragma (if no presenters defined it will be interpreted as ""all presenters"").
I also filter other pragmas as <hidden>.

Available pragmas: 

<presenters: #(name1 name2 ...)>		Define presenter names
<hidden>							Hidden description

"
Class {
	#name : #TkPragmaPresenterBuilder,
	#superclass : #MAPragmaBuilder,
	#instVars : [
		'presenter'
	],
	#category : 'Toolkit-Magritte-Model'
}

{ #category : #'instance creation' }
TkPragmaPresenterBuilder class >> for: anObject presenter: aSymbol [
	^ self new 
		presenter: aSymbol;
		for: anObject
]

{ #category : #accessing }
TkPragmaPresenterBuilder class >> hiddenPragma [ 
	^ #hidden
]

{ #category : #accessing }
TkPragmaPresenterBuilder class >> presentersPragma [ 
	^ #presenters:
]

{ #category : #accessing }
TkPragmaPresenterBuilder >> presenter [
	^ presenter
]

{ #category : #accessing }
TkPragmaPresenterBuilder >> presenter: anObject [
	presenter := anObject
]

{ #category : #private }
TkPragmaPresenterBuilder >> uniqueDescriptionSelectors: anObject [
	| descriptionPragmas selectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class magritteDescriptionPragma 
		from: anObject class to: Object.
	descriptionPragmas := (descriptionPragmas 
		select: [ :each | | presenterPragma |
			presenterPragma := each method pragmaAt: self class presentersPragma.
			presenterPragma isNil 
				or: [ (presenterPragma argumentAt: 1) includes: self presenter ] ])
		select: [ :each | | hiddenPragma |
			hiddenPragma := each method pragmaAt: self class hiddenPragma.
			hiddenPragma isNil ].
			
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors
]
