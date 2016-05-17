examples
exampleImage
	| image |
	image := (World submorphs detect: [ :each | each class = ImageMorph ]) copy.
	OSSDLMorphWindow root: image.
