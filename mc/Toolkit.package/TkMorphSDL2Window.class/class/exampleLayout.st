examples
exampleLayout
	"A window split in two buttons"
	OSSDLMorphWindow root: (Morph new 
		layoutPolicy: TableLayout new;
		cellPositioning: #topLeft;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		addMorph: (SimpleButtonMorph newWithLabel: 'test 1');
		addMorph: (SimpleButtonMorph newWithLabel: 'test 2');
		yourself).
