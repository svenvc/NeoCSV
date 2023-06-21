Class {
	#name : #MACSVField,
	#superclass : #Object,
	#instVars : [
		'descriptionSource',
		'name',
		'encoder',
		'decoder'
	],
	#category : #'Neo-CSV-Magritte'
}

{ #category : #accessing }
MACSVField >> configureDescriptionFor: aWriter [

	| description |
	self descriptionSource isSymbol ifTrue: [
		description := aWriter subjectDescription detect: [ :fieldDesc | 
			fieldDesc definingContext methodSelector = self descriptionSource ] ].
		
	self descriptionSource isBlock ifTrue: [
		description := self descriptionSource value.
		aWriter subjectDescription add: description ].
		
	description 
		propertyAt: aWriter fieldNamePropertyKey
		put: self name.
			
	self encoder ifNotNil: [ :anEncoder |
		description 
			propertyAt: aWriter fieldWriterPropertyKey
			put: anEncoder ].
			
	self decoder ifNotNil: [ :aDecoder |
		description 
			propertyAt: aWriter fieldWriterPropertyKey
			put: aDecoder ].
			
	^ description
]

{ #category : #accessing }
MACSVField >> decoder [
	^ decoder
]

{ #category : #accessing }
MACSVField >> decoder: anObject [
	decoder := anObject
]

{ #category : #accessing }
MACSVField >> descriptionSource [
	^ descriptionSource
]

{ #category : #accessing }
MACSVField >> descriptionSource: anObject [
	"anObject - either a block returning a description, or the defining selector of a description already defined by the domain objects being written"
	
	descriptionSource := anObject
]

{ #category : #accessing }
MACSVField >> encoder [
	^ encoder
]

{ #category : #accessing }
MACSVField >> encoder: anObject [
	encoder := anObject
]

{ #category : #accessing }
MACSVField >> name [
	^ name
]

{ #category : #accessing }
MACSVField >> name: anObject [
	name := anObject
]
