baselines
baseline: spec
	<baseline>
	
	spec for: #pharo do: [ 
		self gettext: spec.
		self twisty: spec.
		spec 
			package: 'Toolkit' with: [ spec requires: #('Twisty' 'Gettext') ] ]