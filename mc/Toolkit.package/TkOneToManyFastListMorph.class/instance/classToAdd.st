private
classToAdd
	^ self magritteDescription classes size = 1
		ifTrue: [ self magritteDescription classes anyOne ]
		ifFalse: [ self pickClass ]