Class {
	#name : #MACSVTestPerson,
	#superclass : #Object,
	#instVars : [
		'customReadField',
		'phoneNumber',
		'birthdate',
		'name'
	],
	#category : #'Neo-CSV-Magritte-Tests'
}

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
		csvReader: [ :s | (s select: #isDigit) asNumber ];
		yourself
]
