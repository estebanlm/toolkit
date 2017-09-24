Extension { #name : #GLMBrowser }

{ #category : #'*Toolkit-Glamour' }
GLMBrowser >> defaultRenderer [ 
	^ GLMRenderer renderer
]

{ #category : #'*Toolkit-Glamour' }
GLMBrowser >> hasToolbar [
	^ self allActions anySatisfy: #isButton
]

{ #category : #'*Toolkit-Glamour' }
GLMBrowser >> windowRendererClass [
	^ TkSystemWindowRenderer
]
