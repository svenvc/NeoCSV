Class {
	#name : #MACSVWriter,
	#superclass : #Object,
	#instVars : [
		'writer',
		'writerClass',
		'target',
		'subjects',
		'map',
		'subjectDescription'
	],
	#category : #'Neo-CSV-Magritte-Visitors'
}

{ #category : #accessing }
MACSVWriter >> execute [
	^ self target isStream
		ifTrue: [ self writeToStream: self target ]
		ifFalse: [ self target ensureCreateFile writeStreamDo: [ :str | self writeToStream: str ] ]
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

{ #category : #private }
MACSVWriter >> subjectDescription [
	^ subjectDescription ifNil: [ subjectDescription := self subjects first magritteDescription ]
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
	| fieldDescriptions header |

	self map do: [ :field | field configureDescriptionFor: self ].
	
	fieldDescriptions := self subjectDescription
		select: [ :desc | desc hasProperty: self fieldNamePropertyKey ].

	header := fieldDescriptions children
			collect: [ :field | field propertyAt: self fieldNamePropertyKey ifAbsent: [ field name ] ].

	fieldDescriptions
		do: [ :field | 
			| converter |
			converter := field
					propertyAt: self fieldWriterPropertyKey
					ifAbsent: [ [ :anObject | field read: anObject ] ].
			self writer addField: converter ].

	self writer
		on: aStream;
		writeHeader: header;
		nextPutAll: self subjects
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
