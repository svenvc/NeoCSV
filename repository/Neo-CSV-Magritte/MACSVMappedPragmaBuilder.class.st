"
I provide a way to extend Magritte element descriptions for CSV reading without modifying the containing domain class. I help avoid bloating domain classes with extensions for each supported CSV source. For example, for contacts, Google has its field names, Outlook has others…  By using me, you will not have to extend existing element descriptions via Magritte's pragma (the one that takes the description selector as an argument).

To configure me, you should:
- set the `#fieldNamePropertyKey` that your reader expects to map descriptions to CSV fields
- as needed, specify the `#fieldReaderPropertyKey` that your reader uses to convert the CSV field string to a domain object; otherwise the default reader will be used

The two primary ways to map fields to descriptions are:
-  `aBuilder map: fieldName fieldTo: descriptionSelector`
-  `aBuilder map: fieldName fieldTo: descriptionSelector using: reader`
"
Class {
	#name : #MACSVMappedPragmaBuilder,
	#superclass : #MAPragmaBuilder,
	#instVars : [
		'map',
		'fieldNamePropertyKey',
		'fieldReaderPropertyKey'
	],
	#category : #'Neo-CSV-Magritte-Support'
}

{ #category : #private }
MACSVMappedPragmaBuilder >> description: description extendedBy: descriptionExtensions for: descriptionSelector of: anObject [
	| result |
	result := super
		description: description
		extendedBy: descriptionExtensions
		for: descriptionSelector
		of: anObject.

	self ensureFieldPropertiesForDescription: result from: descriptionSelector.

	^ result
]

{ #category : #private }
MACSVMappedPragmaBuilder >> ensureFieldPropertiesForDescription: description from: descriptionSelector [ 

	self map
		at: descriptionSelector
		ifPresent: [ :anArray | 
			description 
				propertyAt: self fieldNamePropertyKey
				put: anArray first.
			
			anArray second ifNil: [ ^ self ].
			description 
				propertyAt: self fieldReaderPropertyKey
				put: [ :trimmed | 
					anArray second 
						cull: trimmed 
						cull: description ] ].
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> fieldNamePropertyKey [
	^ fieldNamePropertyKey
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> fieldNamePropertyKey: anObject [
	fieldNamePropertyKey := anObject
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> fieldReaderPropertyKey [
	^ fieldReaderPropertyKey
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> fieldReaderPropertyKey: anObject [
	fieldReaderPropertyKey := anObject
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> map [
	^ map ifNil: [ map := Dictionary new ]
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> map: anObject [
	map := anObject
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> map: fieldName fieldTo: descriptionSelector [

	 self map: fieldName fieldTo: descriptionSelector using: nil
]

{ #category : #accessing }
MACSVMappedPragmaBuilder >> map: fieldName fieldTo: descriptionSelector using: reader [
	"
	descriptionSelector - returning the description to be used
	reader - typically a block, where arguments are: 
	  1) the field string input and 
	  2) the description"

	 self map at: descriptionSelector put: { fieldName. reader }
]
