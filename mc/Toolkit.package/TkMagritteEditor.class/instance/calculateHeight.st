private
calculateHeight
	"
	30=row size
	110=extras (title bar, button bar)
	"
	^ (self description children collect: #tkHeight) sum + 110