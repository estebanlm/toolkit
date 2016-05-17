examples
exampleCheckBox
	"A checkbox"
	OSSDLMorphWindow root: ((CheckboxMorph 
		on: (ValueHolder new contents: true)
		selected: #contents
		changeSelected: #contents:)
		label: 'Show password';
		labelClickable: true;
		height: 25).