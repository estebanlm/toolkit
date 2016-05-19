events
visitWindowResizeEvent: anEvent
	morphicWorld extent: window extent.
	"window dragArea right: (morphicWorld width - 50)."
	window forceUpdate.