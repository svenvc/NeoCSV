Extension { #name : #NeoCSVData }

{ #category : #'*Neo-CSV-GT' }
NeoCSVData >> gtViewDataFOr: composite [
	<gtView>
	| columnedList |
	self data ifNil: [ ^ composite empty ].
	self headerForPresentation ifNil: [ ^ composite empty ].
	columnedList := composite columnedList
		title: 'Data';
		items: [ self data ];
		priority: 35.
	columnedList column: 'nr' text: [ :_ :nr | nr asRopedText foreground: Color gray ] weight: 1.
	self headerForPresentation doWithIndex: [ :column :index | 
		columnedList column: column do: [ :aColumn | 
			aColumn
				item: [ :eachRow | 
					eachRow isDictionary
						ifTrue: [ eachRow at: column ifAbsent: nil ]
						ifFalse: [ eachRow at: index ] ];
				weight: 1 ] ].
	^ columnedList
]

{ #category : #'*Neo-CSV-GT' }
NeoCSVData >> gtViewHeaderFor: composite [
	<gtView>
	self header ifNil: [ ^ composite empty ].
	^ composite columnedList
		title: 'Header';
		priority: 30;
		items: [ self header ];
		column: 'Position' text: [ :_ :position | position ];
		column: 'Field' text: #yourself weight: 5
]
