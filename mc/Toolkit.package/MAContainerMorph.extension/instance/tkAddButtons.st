*Toolkit-Magritte-decorating
tkAddButtons
	^ self tkAddButtons: { 
		GLMGenericAction new 
			action: [ self cancel ];
			title: self magritteDescription tkCancelLabel;
			icon: self magritteDescription tkCancelIcon;
			yourself.
		GLMGenericAction new 
			action: [ self save ];
			title: self magritteDescription tkAcceptLabel;
			icon: self magritteDescription tkAcceptIcon;
			yourself }