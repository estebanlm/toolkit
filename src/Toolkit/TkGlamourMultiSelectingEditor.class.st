"
I'm a generator to select multiple elements from a list.
I answer a collection of elements (might be empty)
"
Class {
	#name : #TkGlamourMultiSelectingEditor,
	#superclass : #TkGlamourSelectingEditor,
	#instVars : [
		'selection'
	],
	#category : 'Toolkit-Editor'
}

{ #category : #building }
TkGlamourMultiSelectingEditor >> buildActionsOn: aBrowser [
	aBrowser transmit
		to: #actions;
		andShow: [ :a | 
			a tkActionList
				act: [ window close ] 
					icon: self cancelIcon
					entitled: 'Cancel';
				act: [ :presenter | value := selection. window close ] 
					icon: self acceptIcon
					entitled: 'Accept' ]
]

{ #category : #building }
TkGlamourMultiSelectingEditor >> buildObjectsOn: aPresenter [
	aPresenter fastTable
		title: self listTitle;
		hideHeader;
		intercellSpacing: 1;
		column: '' evaluated: [ :object | self buildSelectCheckboxFor: object ] width: 16;
		column: '' evaluated: [ :object | self descriptionFor: object ].
]

{ #category : #building }
TkGlamourMultiSelectingEditor >> buildSelectCheckboxFor: anObject [
	^ (CheckboxMorph new
		on: (TkSelectingModel owner: self object: anObject)
		selected: #state
		changeSelected: #state:)
		beCheckbox;
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		yourself
]

{ #category : #initialization }
TkGlamourMultiSelectingEditor >> initialize [
	super initialize.
	selection := Set new
]

{ #category : #private }
TkGlamourMultiSelectingEditor >> isSelected: anObject [ 
	^ selection includes: anObject
]

{ #category : #private }
TkGlamourMultiSelectingEditor >> removeSelection: anObject [ 
	selection remove: anObject 
]

{ #category : #private }
TkGlamourMultiSelectingEditor >> select: anObject [ 
	selection add: anObject 
]

{ #category : #accessing }
TkGlamourMultiSelectingEditor >> selection [ 
	^ selection
]
