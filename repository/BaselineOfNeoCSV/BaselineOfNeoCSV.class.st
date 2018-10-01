"
I am BaselineOfNeoCSV, a way to load the code of the NeoCSV project.
I am a BaselineOf.
"
Class {
	#name : #BaselineOfNeoCSV,
	#superclass : #BaselineOf,
	#category : 'BaselineOfNeoCSV'
}

{ #category : #baselines }
BaselineOfNeoCSV >> baseline: spec [
	<baseline>
	spec for: #common do: [ spec package: 'NeoCSV' ]
]
