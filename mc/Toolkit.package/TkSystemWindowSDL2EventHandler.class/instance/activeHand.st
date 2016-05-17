private
activeHand 
	^ activeHand ifNil: [ 
		activeHand := HandMorph new
			mouseFocus: morphicWorld; 
			yourself  ]