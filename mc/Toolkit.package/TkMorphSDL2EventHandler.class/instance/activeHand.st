private
activeHand 
	^ activeHand ifNil: [
		activeHand := HandMorph new
			privateOwner: rootMorph;
			yourself ]