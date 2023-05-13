Class {
	#name : #MACSVWriterTests,
	#superclass : #TestCase,
	#instVars : [
		'input',
		'objects',
		'person',
		'target',
		'writer'
	],
	#category : #'Neo-CSV-Magritte-Tests'
}

{ #category : #running }
MACSVWriterTests >> setUp [
	person :=  MACSVTestPerson exampleAlanKay.
	target := FileSystem memory / 'people.csv'.
	writer := MACSVWriter new
		target: target;
		subjects: { person };
		yourself
]

{ #category : #tests }
MACSVWriterTests >> testAddedDescription [

	writer
		map: 'Wikipedia' fieldDo: [ :field | 
			field descriptionSource: [ 
				MAUrlDescription new
					accessor: #wikipediaUrl;
					priority: 25;
					csvFieldName: 'Wikipedia';
					yourself ] ];
		execute.
		
	self assert: target contents equals: '"Name","Phone Number","Wikipedia","DOB"
"Alan Kay","","https://en.wikipedia.org/wiki/Alan_Kay","17 May 1940"
' withUnixLineEndings.
]

{ #category : #tests }
MACSVWriterTests >> testAlteredDescription [

	writer
		map: 'Birthplace String' fieldDo: [ :field | 
			field descriptionSource: #birthplaceDescription ];
		execute.
		
	self assert: target contents equals: '"Name","Phone Number","DOB","Birthplace String"
"Alan Kay","","17 May 1940","Springfield, Massachusetts, U.S."
' withUnixLineEndings.
]

{ #category : #tests }
MACSVWriterTests >> testDefaultMapping [
	writer execute.
	self assert: target contents equals: '"Name","Phone Number","DOB"
"Alan Kay","","17 May 1940"
' withUnixLineEndings.
]
