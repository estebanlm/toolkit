private-building
buildListMorph
	| options |
	
	self flag: #workaround. "The call to #yourself will force a voyage proxy to be solved. 
	This problem seems to be happening because when setting the selected item the search for 
	it (using #included:) does not triggers the proxy definition."
	self value yourself.
	options := self options.
	listModel := DropListModel new.
	listModel
		items: options;
		displayBlock: [ :element | 
			element
				ifNotNil: [ self magritteDescription reference toString: element ]
				ifNil: [ '' ] ];
		setSelectedItem: self value;
		whenSelectedItemChanged: [ :e | self value: e ].
	
	"Set start value"
	(options notEmpty and: [ self value isNil ]) ifTrue: [ 
		self memento 
			write: options first 
			using: self magritteDescription ].
	
	^ listModel buildWithSpec.		