Extension { #name : #Object }

{ #category : #'*Toolkit-Magritte' }
Object >> asMagritteMorphFor: presenterSymbol [
	^ (self magritteDescriptionFor: presenterSymbol) asMorphOn: self
]

{ #category : #'*Toolkit-Magritte' }
Object >> asMorphFor: presenterSymbol [
	^ (self magritteDescriptionFor: presenterSymbol) asMorphOn: self
]

{ #category : #'*Toolkit-Magritte' }
Object >> gtInspectorMagritteIn: composite [
	<gtInspectorPresentationOrder: 40>
	
	"Override... just because I still do not work on the proper renderer for magritte"
	composite tkMagritte
		title: 'Form';
		display: [ self ];
		presenter: #inspect;
		when: [ self magritteDescription notEmpty ]
]

{ #category : #'*Toolkit-Magritte' }
Object >> listingDescription [
	"a short description used to easy list objects. 
	 this can be diferent to #asString because the intent of this is provide information for debugging 
	 (bad name, btw), and ours is to provide information for listings"
	^ self asString
]

{ #category : #'*Toolkit-Magritte' }
Object >> magritteDescriptionFor: aSymbol [
	^ TkPragmaPresenterBuilder for: self presenter: aSymbol
]
