Class {
	#name : 'MACSVImporterTests',
	#superclass : 'TestCase',
	#instVars : [
		'input',
		'importer',
		'objects'
	],
	#category : 'Neo-CSV-Magritte-Tests'
}

{ #category : 'as yet unclassified' }
MACSVImporterTests >> readInput: aString [ 
	objects :=  importer 
		source: aString readStream;
		execute
]

{ #category : 'running' }
MACSVImporterTests >> setUp [
	importer :=  MACSVTestPerson maCSVImporter: MACSVImporter.
]

{ #category : 'tests' }
MACSVImporterTests >> testCustomConversion [
	self readInput: 'Phone Number,Ignored Field
1-203-555-0100,something'.
	self assert: objects first phoneNumber equals: 12035550100.
]

{ #category : 'tests' }
MACSVImporterTests >> testDateDefaultConversion [
	self readInput: 'DOB,Ignored Field
2/28/2020,something'.
	self assert: objects first birthdate equals: '2/28/2020' asDate.
]

{ #category : 'tests' }
MACSVImporterTests >> testEmptyField [
	self readInput: 'Phone Number,Ignored Field
,something'.
	self assert: objects first phoneNumber equals: nil.
]

{ #category : 'tests' }
MACSVImporterTests >> testStringDefaultConversion [
	self readInput: 'Name,Ignored Field
Alan Kay,something'.
	self assert: objects first name equals: 'Alan Kay'.
]

{ #category : 'tests' }
MACSVImporterTests >> testTrailingLeadingSpaceIgnored [
	self readInput: 'Name,Ignored Field
 Alan Kay   ,something'.
	self assert: objects first name equals: 'Alan Kay'.
]
