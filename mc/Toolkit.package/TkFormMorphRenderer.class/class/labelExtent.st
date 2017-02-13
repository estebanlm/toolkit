accessing
labelExtent
	"extent of a label (width and height). 
	 Height is necesary because a table layout will take the height of the first element as the default 
	 height and will format all rows to that."
	^ self labelWidth @ self rowHeight