baselines
baseline: spec
	<baseline>
	
	spec for: #pharo do: [ 
		self gettext: spec.
		self magritte3: spec.
		self twisty: spec.
		spec 
			package: 'Toolkit' with: [ spec requires: #('Twisty' 'Gettext') ] ]