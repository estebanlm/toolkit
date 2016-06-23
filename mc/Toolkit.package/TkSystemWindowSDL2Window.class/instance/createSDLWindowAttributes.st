initialization
createSDLWindowAttributes
	^ OSWindowAttributes new 
		preferableDriver: OSSDL2Driver current;
		title: self title;
		bounds: (0@0 extent: (self initialExtent max: self rootMorph extent));
		visible: false;
		yourself