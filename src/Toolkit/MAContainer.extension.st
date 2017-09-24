Extension { #name : #MAContainer }

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> defaultMorphClass [
	^ TkPlatform current magritteDefaultContainerClass
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkAcceptIcon [
	^ self propertyAt: #tkAcceptIcon ifAbsent: [ self class tkDefaultAcceptIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkAcceptIcon: anIcon [
	^ self propertyAt: #tkAcceptIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkAcceptIcon: anIcon label: aString [ 
	self tkAcceptIcon: anIcon.
	self tkAcceptLabel: aString.
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkAcceptLabel [
	^ self propertyAt: #tkAcceptLabel ifAbsent: [ self class tkDefaultAcceptLabel ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkAcceptLabel: aString [
	^ self propertyAt: #tkAcceptLabel put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkCancelIcon [
	^ self propertyAt: #tkCancelIcon ifAbsent: [ self class tkDefaultCancelIcon ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkCancelIcon: anIcon [
	^ self propertyAt: #tkCancelIcon put: anIcon
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkCancelIcon: anIcon label: aString [ 
	self tkCancelIcon: anIcon.
	self tkCancelLabel: aString.
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkCancelLabel [
	^ self propertyAt: #tkCancelLabel ifAbsent: [ self class tkDefaultCancelLabel ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkCancelLabel: aString [
	^ self propertyAt: #tkCancelLabel put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> tkDefaultAcceptIcon [
	^ Smalltalk ui icons iconNamed: 'smallOk'
]

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> tkDefaultAcceptLabel [
	^ 'Accept'
]

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> tkDefaultCancelIcon [
	^ Smalltalk ui icons iconNamed: 'smallCancel'
]

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> tkDefaultCancelLabel [
	^ 'Cancel'
]

{ #category : #'*Toolkit-Magritte' }
MAContainer classSide >> tkDefaultFormRenderer [
	^ TkFormRenderer
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkFormRenderer [
	^ self propertyAt: #tkFormRenderer ifAbsent: [ self class tkDefaultFormRenderer ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkFormRenderer: aClass [
	^ self propertyAt: #tkFormRenderer put: aClass
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkGeneratorLabel [
	^ self propertyAt: #tkGeneratorLabel ifAbsent: [ nil ]
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkGeneratorLabel: aString [
	^ self propertyAt: #tkGeneratorLabel put: aString
]

{ #category : #'*Toolkit-Magritte' }
MAContainer >> tkHeight [
	^ (self children collect: #tkHeight) sum
]
