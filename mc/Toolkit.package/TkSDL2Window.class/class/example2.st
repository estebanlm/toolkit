examples
example2
" 
Draw simple filled path, changing the transformation and colors to get some animated effects.

 self example2
"
	| surface window |
	
	window := self openLabel: 'Example 1' x: 0 y: 0 width: 500 height: 500.
	surface := window surface.
	surface drawDuring: [:canvas | | path |
		surface clear: Color white.
		canvas setPaint: Color blue.

		canvas pathTransform translateX: 200 Y: 200.	
		canvas pathTransform scaleBy: 6.
		path := canvas createPath: [ :pathbuilder |
			pathbuilder 
				absolute;
				moveTo: -25 @ -25;
				curveVia: 25@ -25 to: 25@25;
				curveVia: -25@25 to: -25@ -25 ].
		
			1 to: 1000 do: [:i |
				canvas setPaint: Color random.
				canvas pathTransform restoreAfter: [
					canvas pathTransform rotateByDegrees: i*5.
					canvas pathTransform scaleBy: (1- ( i/2000)).
					canvas drawShape: path.
				].
				window updateSurface ] ].
	"window inspect."