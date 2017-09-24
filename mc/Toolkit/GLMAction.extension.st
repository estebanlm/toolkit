Extension { #name : #GLMAction }

{ #category : #'*Toolkit-Glamour' }
GLMAction >> actOn: anObject from: aMorph [
	^ self action glamourValueWithArgs: { anObject. aMorph }
]

{ #category : #'*Toolkit-Glamour' }
GLMAction >> isEnabledOnModel: anObject [
	^ self enabledCondition glamourValueWithArgs: { anObject }
]

{ #category : #'*Toolkit-Glamour' }
GLMAction >> tkButtonMorph [
	^ PluggableButtonMorph new 
		width: self class tkButtonMorphWidth;
		hResizing: #rigid;
		icon: self icon;
		label: self title;
		actionBlock: self action;
		beIconLeft;
		yourself
]

{ #category : #'*Toolkit-Magritte' }
GLMAction class >> tkButtonMorphWidth [
	^ 120
]
