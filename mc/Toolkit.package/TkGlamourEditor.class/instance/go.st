generating
go 
	| browser |

	value := nil.
	browser := self buildBrowser.
	browser startOn: self startValue.
	window := TkPlatform current renderBrowser: browser.
	window extent: browser initialExtent.
	window tkOpenModal.
	
	^ self value
		ifNotNil: [ self createObject ]