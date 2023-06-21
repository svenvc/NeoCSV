Class {
	#name : #MACSVTestPerson,
	#superclass : #Object,
	#instVars : [
		'phoneNumber',
		'birthdate',
		'name',
		'birthplace',
		'wikipediaUrl'
	],
	#category : #'Neo-CSV-Magritte-Tests'
}

{ #category : #accessing }
MACSVTestPerson class >> exampleAlanKay [

	^ self new
		name: 'Alan Kay';
		birthdate: '5/17/1940' asDate;
		birthplace: 'Springfield, Massachusetts, U.S.';
		wikipediaUrl: 'https://en.wikipedia.org/wiki/Alan_Kay' asUrl
		yourself
]

{ #category : #'magritte-accessing' }
MACSVTestPerson >> addressDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #address;
		priority: 40;
		yourself
]

{ #category : #accessing }
MACSVTestPerson >> birthdate [
	^ self maLazyInstVarUsing: self birthdateDescription
]

{ #category : #accessing }
MACSVTestPerson >> birthdate: aDate [
	birthdate := aDate
]

{ #category : #'magritte-accessing' }
MACSVTestPerson >> birthdateDescription [
	<magritteDescription>
	^ MADateDescription new
		accessor: #birthdate;
		csvFieldName: 'DOB';
		priority: 30;
		yourself
]

{ #category : #accessing }
MACSVTestPerson >> birthplace [
	^ birthplace
]

{ #category : #accessing }
MACSVTestPerson >> birthplace: anObject [
	birthplace := anObject
]

{ #category : #'magritte-accessing' }
MACSVTestPerson >> birthplaceDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #birthplace;
		priority: 40;
		yourself
]

{ #category : #accessing }
MACSVTestPerson >> name [
	^ self maLazyInstVarUsing: self nameDescription
]

{ #category : #accessing }
MACSVTestPerson >> name: aString [
	name := aString
]

{ #category : #'magritte-accessing' }
MACSVTestPerson >> nameDescription [
	<magritteDescription>
	^ MAStringDescription new
		accessor: #name;
		csvFieldName: 'Name';
		priority: 10;
		yourself
]

{ #category : #accessing }
MACSVTestPerson >> phoneNumber [
	^ self maLazyInstVarUsing: self phoneNumberDescription
]

{ #category : #accessing }
MACSVTestPerson >> phoneNumber: aNumber [
	phoneNumber := aNumber
]

{ #category : #'magritte-accessing' }
MACSVTestPerson >> phoneNumberDescription [
	<magritteDescription>
	^ MANumberDescription new
		accessor: #phoneNumber;
		csvFieldName: 'Phone Number';
		priority: 20;
		csvReader: [ :s | (s select: #isDigit) asNumber ];
		yourself
]

{ #category : #accessing }
MACSVTestPerson >> wikipediaUrl [
	^ wikipediaUrl
]

{ #category : #accessing }
MACSVTestPerson >> wikipediaUrl: anObject [
	wikipediaUrl := anObject
]
