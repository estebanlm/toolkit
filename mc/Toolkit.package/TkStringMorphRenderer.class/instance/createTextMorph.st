private factory
createTextMorph
	^ TwyTextMorph new
		beEditable;
		height: self class rowHeight;
		in: [ :this |  	
			(this ensureTool: TwyEditorTool) defaultTextColor: Smalltalk ui theme textColor ];
		yourself.
