rendering
actOnPresentationUpdated: ann
	container removeAllMorphs.
	container 
		addMorph: (self magritteMorphFrom: ann presentation)
		fullFrame: LayoutFrame identity