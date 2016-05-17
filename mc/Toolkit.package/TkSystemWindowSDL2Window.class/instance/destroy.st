private
destroy
	"Ensuring the window is valid before, because I'm most likely sending twice the #close message. 
	 I need to be sure the window is being disposed also when child window is deleted (see 
	 #prepareRootMorph and #close methods)"
	self isValid ifFalse: [ ^ self ].
	^ super destroy