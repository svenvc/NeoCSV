initialize-release
separator: character
	"Set character to be used as separator"
	
	self assert: character isCharacter.
	separator := character 