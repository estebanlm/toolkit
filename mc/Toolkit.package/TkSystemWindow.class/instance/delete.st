open/close
delete
	| willClose |

	(willClose := WindowWillClose new) 
		window: self;
		yourself.
	self announce: willClose.
	willClose canClose ifFalse: [ ^ self ].
	super delete
