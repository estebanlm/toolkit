events
dispatchMorphicEvent: anEvent
	"Dispatch the event in the UI thread, to emulate world function"
	self flag: #todo. "Not sure this should be fine... maybe this is my oportunity to separate the 
	UI thread, and the application thread... but we'll see."
	WorldState defer: [ self activeHand handleEvent: anEvent ]. 
