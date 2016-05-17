private
uniqueDescriptionSelectors: anObject
	| descriptionPragmas selectors |
	
	descriptionPragmas := Pragma 
		allNamed: self class magritteDescriptionPragma 
		from: anObject class to: Object.
	descriptionPragmas := (descriptionPragmas 
		select: [ :each | | presenterPragma |
			presenterPragma := each method pragmaAt: self class presentersPragma.
			presenterPragma isNil 
				or: [ (presenterPragma argumentAt: 1) includes: self presenter ] ])
		select: [ :each | | hiddenPragma |
			hiddenPragma := each method pragmaAt: self class hiddenPragma.
			hiddenPragma isNil ].
			
	selectors := descriptionPragmas collect: [ :each | each method selector ].
	
	^ Set withAll: selectors