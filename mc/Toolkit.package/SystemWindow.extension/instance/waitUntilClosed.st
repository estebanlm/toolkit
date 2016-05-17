*Toolkit-Platform-showing
waitUntilClosed
	[ self world notNil ]
		whileTrue: [ self outermostWorldMorph doOneCycle ].
	