examples
example1
	" 
	This example demostrates that same path could be reused multiple times when drawing.
	First, we creating a path, and later we can use it in #drawShape: command.
	self example1
	"

	| surf path window |
	
	window := self openLabel: 'Example 1' x:0 y: 0 width: 300 height: 300.
	surf := window surface.
	
	path := surf createRectanglePath: (0@ 0 corner: 20@ 20).
	
	surf drawDuring: [:can |
		surf clear: Color white.
		can pathTransform loadIdentity.
		can setPaint: (Color red).
		can pathTransform translateX: 5 Y: 5.
		can drawShape: path.
		can setPaint: (Color blue).
		can pathTransform translateX: 5 Y: 5.
		can drawShape: path.
	].

	window updateSurface.
	"Display getCanvas drawImage: 	surf asForm  at: 0@0"
	"window inspect."
