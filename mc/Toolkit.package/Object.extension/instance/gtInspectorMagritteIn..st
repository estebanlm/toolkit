*Toolkit-Magritte
gtInspectorMagritteIn: composite
	<gtInspectorPresentationOrder: 40>
	
	"Override... just because I still do not work on the proper renderer for magritte"
	composite tkMagritte
		title: 'Form';
		display: [ self ];
		when: [ self magritteDescription notEmpty ]