actions
pickDate
	| calendar |
	calendar := CalendarMorph openOn: self value.
	calendar
		center: calendar cursorPoint;
		fitInWorld;
		onChoiceSend: #onDateChosen: to: self.