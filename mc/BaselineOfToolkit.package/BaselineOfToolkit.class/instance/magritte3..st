external projects
magritte3: spec
	spec
		project: 'Magritte3'
		with: [ 
			spec
				className: 'ConfigurationOfMagritte3';
				versionString: #stable;
				loads: #('Magritte-Morph' 'Magritte-GT');
				repository: 'http://www.smalltalkhub.com/mc/Magritte/Magritte3/main' ]