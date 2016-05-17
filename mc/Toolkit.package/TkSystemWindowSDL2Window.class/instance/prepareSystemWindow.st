initialization
prepareSystemWindow
	self rootMorph 
		"extent: self rootMorph initialExtent;"
		beSticky;
		beUnresizeable;
		removeBoxes;
		removeLabelArea.
		
	self rootMorph announcer 
		when: WindowClosed send: #destroy to: self.