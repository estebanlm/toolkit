"
I'm an action to extend behaviour of glamour toolbars (which are far too restrictive IMO).
My children will add behaviour as desired, check at them. 

"
Class {
	#name : #TkExtentedAction,
	#superclass : #TkAction,
	#category : 'Toolkit-Glamour-Presentation'
}

{ #category : #rendering }
TkExtentedAction >> renderGlamorouslyOn: aRenderer [
	^ aRenderer renderExtendedAction: self
]
