actions
onDateChosen: aCalendar
	aCalendar calendar delete.
	self value: aCalendar date.
	self changed: #string