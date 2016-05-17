rendering
render: aMagrittePresentation
	container := GLMMorphic containerMorph.
	container 
		addMorph: (self magritteMorphFrom: aMagrittePresentation) 
		fullFrame: LayoutFrame identity.
	
	aMagrittePresentation 
		when: GLMPresentationUpdated 
		send: #actOnPresentationUpdated: 
		to: self.
	
	^ container