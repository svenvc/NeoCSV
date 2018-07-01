*Neo-CSV-Magritte
csvFile
	"To use CSV Magritte, subclasses need to implement this. `self subclassResponsibility` is commented out because many classes won't use CSV and we don't want them all to be flagged with forgetting to implement it. This sort of thing should probably be in a trait, but we still haven't ripped the bandaid off i.e. committed to forgetting about compatibility with non-Pharo systems.
	
	self subclassResponsibility"