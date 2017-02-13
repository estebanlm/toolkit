private
withModel: aModel do: aBlock on: aMorph
	aBlock value: (self visitor copy 
		model: aModel;
		morph: aMorph;
		yourself).
		
	