opening
openLabel: aString
	| window contents |
	
	window := (SystemWindow labelled: aString) 
		"model: self;"
		extent: 250@80;
		yourself.
	contents := PanelMorph new
		changeTableLayout;
		yourself.
		
	contents addMorph: ((PluggableTextFieldMorph on: self text: #lastTime accept: nil)
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		enabled: false;
		yourself).
	contents addMorph: ((PluggableTextFieldMorph on: self text: #lastFPS accept: nil)
		vResizing: #spaceFill;
		hResizing: #spaceFill;
		enabled: false;
		yourself).

	window addMorph: contents frame: LayoutFrame identity.
	
	^ window openAsIs