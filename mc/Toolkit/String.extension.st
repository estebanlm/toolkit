Extension { #name : #String }

{ #category : #'*Toolkit-Gettext' }
String >> localised [
	^ NaturalLanguageTranslator translate: self
]

{ #category : #'*Toolkit-Gettext' }
String >> localisedTo: localeID [
	^ NaturalLanguageTranslator translate: self toLocale: localeID
]
