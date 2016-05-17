private-building
buildListMorph
	| options |
	
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