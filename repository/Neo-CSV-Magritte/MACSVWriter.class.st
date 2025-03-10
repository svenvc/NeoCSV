Class {
	#name : #MACSVWriter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'writerClass',
		'target',
		'subjects',
		'map',
		'subjectDescription',
		'ignoresUnkownFields',
		'includesHeader'
	],
	#category : #'Neo-CSV-Magritte-Visitors'
}

{ #category : #accessing }
MACSVWriter >> execute [
	^ self target isStream
		ifTrue: [ self writeToStream: self target ]
		ifFalse: [ self target ensureCreateFile writeStreamDo: [ :str | self writeToStream: str ] ]
]

{ #category : #private }
MACSVWriter >> fieldDescriptions [
	^ self subjectDescription
		select: [ :desc | desc hasProperty: self fieldNamePropertyKey ]
]

{ #category : #accessing }
MACSVWriter >> fieldNamePropertyKey [
	"The property where the element description stores the field name; override to customize"

	^ #csvFieldName
]

{ #category : #accessing }
MACSVWriter >> fieldWriterPropertyKey [
	"The property where the element description stores the field reader. Override to customize. See `MAElementDescription>>#csvReader:` method comment for more info"

	^ #csvWriter
]

{ #category : #private }
MACSVWriter >> header [
	^ self fieldDescriptions children
		collect: [ :field | field propertyAt: self fieldNamePropertyKey ifAbsent: [ field name ] ]
]

{ #category : #accessing }
MACSVWriter >> ignoresUnknownFields [
	^ ignoresUnkownFields ifNil: [ false ]
]

{ #category : #accessing }
MACSVWriter >> ignoresUnknownFields: anObject [
	ignoresUnkownFields := anObject
]

{ #category : #accessing }
MACSVWriter >> includesHeader [
	^ includesHeader ifNil: [ true ].
]

{ #category : #accessing }
MACSVWriter >> includesHeader: anObject [
	includesHeader := anObject
]

{ #category : #accessing }
MACSVWriter >> map [

	^ map ifNil: [ map := OrderedCollection new ]
]

{ #category : #accessing }
MACSVWriter >> map: aString fieldDo: aBlock [

	| field |
	field := MACSVField new
		name: aString;
		yourself.
		
	aBlock value: field.
	
	self map add: field.
]

{ #category : #accessing }
MACSVWriter >> map: aString fieldSource: aBlock [

	self
		map: aString 
		fieldDo: [ :field | field descriptionSource: aBlock ]
]

{ #category : #accessing }
MACSVWriter >> subjectDescription [
	^ subjectDescription ifNil: [ subjectDescription := self subjects atRandom magritteDescription ]
]

{ #category : #accessing }
MACSVWriter >> subjectDescription: anMAContainer [
	subjectDescription := anMAContainer
]

{ #category : #accessing }
MACSVWriter >> subjects [
	^ subjects
]

{ #category : #accessing }
MACSVWriter >> subjects: anObject [
	subjects := anObject
]

{ #category : #accessing }
MACSVWriter >> target [

	^ target
]

{ #category : #accessing }
MACSVWriter >> target: aFileOrStream [

	target := aFileOrStream
]

{ #category : #private }
MACSVWriter >> writeToStream: aStream [
	self subjects isEmptyOrNil ifTrue: [ ^ self ].

	self map do: [ :field | field configureDescriptionFor: self ].

	self fieldDescriptions
		do: [ :field | 
			| converter wrappedConverter |
			converter := field
					propertyAt: self fieldWriterPropertyKey
					ifAbsent: #yourself.
			wrappedConverter := [ :anObject |
				(self ignoresUnknownFields not or: [ field accessor canRead: anObject ])
					ifTrue: [
						| aValue |
						aValue := field read: anObject.
						
						"`#read: returns either a non-nil value or #undefinedValue, so the following test is sufficient e.g. not checking for nil"
						aValue = field undefinedValue ifTrue: [
							aValue := field default ].
							
						converter cull: aValue cull: anObject ]
					ifFalse: [ nil ] ].
			self writer addField: wrappedConverter ].

	writer := self writer on: aStream.

	self includesHeader ifTrue: [ writer writeHeader: self header ].

	writer nextPutAll: self subjects
]

{ #category : #accessing }
MACSVWriter >> writer [
	^ writer ifNil: [ writer := self writerClass new ]
]

{ #category : #accessing }
MACSVWriter >> writerClass [
	^ writerClass ifNil: [ NeoCSVWriter ]
]

{ #category : #accessing }
MACSVWriter >> writerClass: aClass [
	writerClass := aClass
]
