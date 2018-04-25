initialize-release
addIgnoredFields: count
	"Add a count of consecutive ignored fields to receiver."

	count timesRepeat: [ self addIgnoredField ]