event handling
mouseDown: evt 
	"Make this TextMorph be the keyboard input focus, if it isn't  
	already, and repond to the text selection gesture"
	self hasKeyboardFocus
		ifFalse: [ self textMorph takeKeyboardFocus ]