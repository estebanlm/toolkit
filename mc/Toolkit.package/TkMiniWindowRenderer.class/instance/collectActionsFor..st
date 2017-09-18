private
collectActionsFor: aPresentation
	^ aPresentation allActions
	 "collect: [ :each | 
		each icon 
			ifNotNil: [ 
				each copy 
					icon: (each icon scaledToSize: 10@10);
					yourself ]
			ifNil: [ 
				each ] ]"