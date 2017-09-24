Extension { #name : #GLMPresentation }

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> act: aBlock icon: anIcon entitled: aString enabledWhen: conditionBlock [
	self 
		addAction: 
			(TkAction new 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)
]

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> act: aBlock icon: anIcon entitled: aString when: conditionBlock [
	self 
		addAction: 
			((GLMGenericAction new) 
				action: aBlock; 
				icon: anIcon;
				title: aString; 
				condition: conditionBlock;
				yourself)
]

{ #category : #'*Toolkit-Glamour' }
GLMPresentation >> initialExtent [
	"by default, no initial extent is set... I'm answering this to be able to iterate on presentations 
	 (to calculate a real initial extent, since browsers can define an initial extent but 
	 composites don't)"
	^ 0@0
]

{ #category : #'*Toolkit-Glamour' }
GLMPresentation >> isMiniWindow [
	"Subclasses needs to implement this to mark a class as 'MiniWindow'"
	^ false
]

{ #category : #'*Toolkit-Glamour' }
GLMPresentation >> miniWindowRendererClass [
	^ self windowRendererClass
]

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> selectionAct: aBlock entitled: aString enabledWhen: conditionBlock [
	self 
		addSelectionAction: 
			(TkAction new
				action: aBlock; 
				title: aString; 
				enabledCondition: conditionBlock;
				yourself)
]

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> selectionAct: aBlock entitled: aString when: conditionBlock [
	self 
		addSelectionAction: 
			((GLMGenericAction new) 
				action: aBlock; 
				title: aString; 
				condition: conditionBlock;
				yourself)
]

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> toggleAct: aBlock icon: anIcon entitled: aString [
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				unpresedIcon: anIcon;
				title: aString;
				yourself)
]

{ #category : #'*Toolkit-Glamour-scripting' }
GLMPresentation >> toggleAct: aBlock icon: anIcon entitled: aString initialState: aBoolean [
	self 
		addAction: 
			((TkToggleAction new) 
				action: aBlock; 
				unpresedIcon: anIcon;
				title: aString;
				state: aBoolean;
				yourself)
]

{ #category : #'*Toolkit-Glamour' }
GLMPresentation >> windowRendererClass [
	^ GLMMorphicWindowRenderer
]
