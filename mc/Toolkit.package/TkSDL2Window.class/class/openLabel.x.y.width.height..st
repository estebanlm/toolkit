instance creation
openLabel: title x: x y: y width: w height: h
	^ self createWithAttributes: (OSWindowAttributes new 
		title: title;
		bounds: (x@y extent: w@h);
		preferableDriver: OSSDL2Driver current;
		yourself)