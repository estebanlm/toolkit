drawing
redrawDamagedOwners
	"Same as damaged, but redraw owners (to ensure cleaning)"
	| damaged |

	"If damages includes wrapped morph, then I need to redraw all"
	(damageRecorder invalidMorphs includes: self wrappedMorph)  
		ifTrue: [ ^ self redrawAll ].
		
	damaged := damageRecorder invalidMorphs copy.
	self renderer surface drawDuring: [ :canvas |
		damaged reverseDo: [ :each | canvas fullDrawMorph: each owner ] ]