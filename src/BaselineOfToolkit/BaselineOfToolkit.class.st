Class {
	#name : #BaselineOfToolkit,
	#superclass : #BaselineOf,
	#category : 'BaselineOfToolkit'
}

{ #category : #baselines }
BaselineOfToolkit >> baseline: spec [
	<baseline>
	
	spec for: #pharo do: [ 
		self gettext: spec.
		self magritte3: spec.
		self twisty: spec.
		spec 
			package: 'Toolkit' with: [ spec requires: #('Twisty' 'Gettext') ] ]
]

{ #category : #'external projects' }
BaselineOfToolkit >> gettext: spec [
	spec
		project: 'Gettext'
		with: [ 
			spec
				className: 'ConfigurationOfGettext';
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/PharoExtras/Gettext/main' ]
]

{ #category : #'external projects' }
BaselineOfToolkit >> magritte3: spec [
	spec
		project: 'Magritte3'
		with: [ 
			spec
				className: 'ConfigurationOfMagritte3';
				versionString: #stable;
				loads: #('Magritte-Morph' 'Magritte-GT');
				repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main' ]
]

{ #category : #'external projects' }
BaselineOfToolkit >> twisty: spec [
	spec
		project: 'Twisty'
		with: [ 
			spec
				className: 'ConfigurationOfTwisty';
				versionString: #stable;
				repository: 'http://smalltalkhub.com/mc/dionisiy/Twisty/main' ]
]
