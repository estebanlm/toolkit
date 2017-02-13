*Toolkit-Magritte-decorating
tkAddAcceptButton
	^ self tkAddButtons: { 
		GLMGenericAction new 
			action: [ self save ];
			title: self magritteDescription tkAcceptLabel;
			icon: self magritteDescription tkAcceptIcon;
			yourself }