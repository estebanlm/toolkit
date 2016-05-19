initialization
createSDLWindowAttributes
	^ OSWindowAttributes new 
		title: self title;
		bounds: (0@0 extent: (self initialExtent max: self rootMorph extent));
		preferableDriver: OSSDL2Driver current;
		visible: false;
		yourself