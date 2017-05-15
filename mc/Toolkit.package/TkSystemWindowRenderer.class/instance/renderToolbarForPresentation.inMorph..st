rendering
renderToolbarForPresentation: aPresentation inMorph: aMorph
	| dock buttons |
	
	dock := aMorph theme newToolDockingBarIn: aMorph.
	aPresentation toolbarPosition configureToolbar: dock.
	buttons := self toolbarButtonsForPresentation: aPresentation.
	dock addAllMorphs: buttons.
	(aPresentation allActions select: #isMenu) 
		ifNotEmpty: [ 
			dock addMorphBack: (Morph new 
				color: Color transparent;
				hResizing: #spaceFill;
				vResizing: #spaceFill;
				yourself).
			dock addMorphBack: ((self 
				dropDownMenuFrom: [ | menu |
					menu := self menuIn: MenuMorph new for: aPresentation.
					menu popUpEvent: self currentEvent in: aMorph world ]
				withIcon: #glamorousMore asIcon)
				yourself)].
	
	^ dock