Extension { #name : #GLMMorphicWidgetRenderer }

{ #category : #'*Toolkit-Glamour' }
GLMMorphicWidgetRenderer >> renderer [
	^ renderer ifNil: [renderer := GLMRenderer renderer ]
]
