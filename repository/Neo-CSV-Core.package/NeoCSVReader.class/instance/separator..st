initialize-release
separator: character
	"Set the field separator character to use, defaults to comma"
	
	self assert: character isCharacter.
	separator := character 