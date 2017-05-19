generating
go 
	| browser |

	value := nil.
	browser := self buildBrowser.
	browser initialExtent: (self preferredExtent ifNil: [ browser initialExtent ]).
	browser startOn: self startValue.
	window := TkPlatform current renderBrowser: browser.
	window tkOpenModal.
	
	^ self value
		ifNotNil: [ self createObject ]