initialization
initialize 
	super initialize.
	needsDisplay := false.
	damageRecorder := DamageRecorder new.
	self 
		layoutPolicy: ProportionalLayout new;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutInset: 0