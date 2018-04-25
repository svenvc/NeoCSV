accessing
select: filter thenDo: block
	"Execute block for each record that satisfies filter until I am at end."

	[ self atEnd ]
		whileFalse: [ 
			| record |
			record := self next.
			(filter value: record)
				ifTrue: [ block value: record ] ]