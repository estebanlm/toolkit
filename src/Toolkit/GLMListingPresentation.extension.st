Extension { #name : #GLMListingPresentation }

{ #category : #'*Toolkit-scripting' }
GLMListingPresentation >> selectionAct: aBlock [
	"usefull for acting on single selection"
	self onChangeOfPort: #selection act: aBlock
]

{ #category : #'*Toolkit-scripting' }
GLMListingPresentation >> strongSelectionAct: aBlock [
	"usefull for acting on double click"
	self onChangeOfPort: #strongSelection act: aBlock
]
