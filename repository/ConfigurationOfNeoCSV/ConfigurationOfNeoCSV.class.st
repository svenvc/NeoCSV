"
I am ConfigurationOfNeoCSV, a Metacello configuration for NeoCSV.

NeoCSV is a flexible and efficient reader and writer for CSV and other delimiter-separated-value formats like TSV.

License MIT.
"
Class {
	#name : #ConfigurationOfNeoCSV,
	#superclass : #Object,
	#instVars : [
		'project'
	],
	#classVars : [
		'LastVersionLoad'
	],
	#category : 'ConfigurationOfNeoCSV'
}

{ #category : #'development support' }
ConfigurationOfNeoCSV class >> DevelopmentSupport [

"See the methods in the 'development support' category on the class-side of MetacelloBaseConfiguration. Decide what development support methods you would like to use and copy them the the class-side of your configuration."
	<apiDocumentation>

]

{ #category : #private }
ConfigurationOfNeoCSV class >> baseConfigurationClassIfAbsent: aBlock [

	^Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			self ensureMetacelloBaseConfiguration.
			Smalltalk at: #MetacelloBaseConfiguration ifAbsent: aBlock ].

]

{ #category : #accessing }
ConfigurationOfNeoCSV class >> catalogContactInfo [
	^ 'Written and maintained by Sven Van Caekenberghe (http://stfx.eu) and the community. Discussions on the Pharo mailing lists.'
]

{ #category : #accessing }
ConfigurationOfNeoCSV class >> catalogDescription [
	^ 'CSV (Comma Separated Values) is a popular data-interchange format. NeoCSV is an elegant and efficient standalone framework to read and write CSV converting to or from Smalltalk objects.'
]

{ #category : #accessing }
ConfigurationOfNeoCSV class >> catalogKeywords [
	^ #(format input output #'comma-separated-values' csv #'tab-separated-values' tsv #'tabular-data' records fields #'rfc-4180' text ascii)
]

{ #category : #private }
ConfigurationOfNeoCSV class >> ensureMetacello [

	(self baseConfigurationClassIfAbsent: []) ensureMetacello
]

{ #category : #private }
ConfigurationOfNeoCSV class >> ensureMetacelloBaseConfiguration [

	Smalltalk
		at: #MetacelloBaseConfiguration
		ifAbsent: [ 
			| repository version |
			repository := MCHttpRepository location: 'http://seaside.gemstone.com/ss/metacello' user: '' password: ''.
			repository
				versionReaderForFileNamed: 'Metacello-Base-DaleHenrichs.2.mcz'
				do: [ :reader | 
					version := reader version.
					version load.
					version workingCopy repositoryGroup addRepository: repository ] ]
]

{ #category : #'metacello tool support' }
ConfigurationOfNeoCSV class >> isMetacelloConfig [
	"Answer true and the Metacello tools will operate on you"
	
	^true
]

{ #category : #loading }
ConfigurationOfNeoCSV class >> load [
	"Load the #stable version defined for this platform. The #stable version is the version that is recommended to be used on this platform."

	"self load"

	<apiDocumentation>
	^(self project version: #stable) load
]

{ #category : #loading }
ConfigurationOfNeoCSV class >> loadBleedingEdge [
	"Load the latest versions of the mcz files defined for this project. It is not likely that the #bleedingEdge has been tested."

	"self loadBleedingEdge"

	<apiDocumentation>
	^(self project version: #bleedingEdge) load
]

{ #category : #loading }
ConfigurationOfNeoCSV class >> loadDevelopment [
	"Load the #development version defined for this platform. The #development version will change over time and is not expected to be stable."

	"self loadDevelopment"

	<apiDocumentation>
	^(self project version: #development) load
]

{ #category : #accessing }
ConfigurationOfNeoCSV class >> project [

	^self new project
]

{ #category : #'development support' }
ConfigurationOfNeoCSV class >> validate [
	"Check the configuration for Errors, Critical Warnings, and Warnings (see class comment for MetacelloMCVersionValidator for more information). 
	Errors identify specification issues that will result in unexpected behaviour when you load the configuration. 
	Critical Warnings identify specification issues that may result in unexpected behavior when you load the configuration.
	Warnings identify specification issues that are technically correct, but are worth take a look at."

	"self validate"

	<apiDocumentation>
	self ensureMetacello.
	^ ((Smalltalk at: #MetacelloToolBox) validateConfiguration: self debug: #() recurse: false) explore
]

{ #category : #baselines }
ConfigurationOfNeoCSV >> baseline1: spec [
	<version: '1-baseline'>
	
	spec for: #common do: [
		spec 
			blessing: #baseline;
			repository: 'http://mc.stfx.eu/Neo';
			package: 'Neo-CSV-Core';
			package: 'Neo-CSV-Tests' with: [ spec requires: 'Neo-CSV-Core' ];
			group: 'default' with: #('Neo-CSV-Core' 'Neo-CSV-Tests');
			group: 'Core' with: #('Neo-CSV-Core');
			group: 'Tests' with: #('Neo-CSV-Tests') ]
]

{ #category : #accessing }
ConfigurationOfNeoCSV >> project [

	^ project ifNil: [ | constructor |
		"Bootstrap Metacello if it is not already loaded"
		(self class baseConfigurationClassIfAbsent: []) ensureMetacello.
		"Construct Metacello project"
		constructor := (Smalltalk at: #MetacelloVersionConstructor) on: self.
		project := constructor project.
		project loadType: #linear. "change to #atomic if desired"
		project ]
]

{ #category : #'symbolic versions' }
ConfigurationOfNeoCSV >> stable: spec [
	<symbolicVersion: #'stable'>
	
	spec for: #common version: '15'
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version10: spec [
	<version: '10' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.16';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.15' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version11: spec [
	<version: '11' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.20';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.17' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version12: spec [
	<version: '12' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.21';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.18' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version13: spec [
	<version: '13' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.22';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.19' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version14: spec [
	<version: '14' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.24';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.20' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version15: spec [
	<version: '15' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.26';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.23' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version1: spec [
	<version: '1' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.6';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.6' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version2: spec [
	<version: '2' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.8';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.6' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version3: spec [
	<version: '3' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.9';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.7' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version4: spec [
	<version: '4' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.9';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.8' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version5: spec [
	<version: '5' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.10';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.9' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version6: spec [
	<version: '6' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.12';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.11' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version7: spec [
	<version: '7' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.13';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.12' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version8: spec [
	<version: '8' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.14';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.13' ]
]

{ #category : #versions }
ConfigurationOfNeoCSV >> version9: spec [
	<version: '9' imports: #('1-baseline')>
	
	spec for: #common do: [
		spec
			blessing: #release;
			package: 'Neo-CSV-Core' with: 'Neo-CSV-Core-SvenVanCaekenberghe.15';
			package: 'Neo-CSV-Tests' with: 'Neo-CSV-Tests-SvenVanCaekenberghe.14' ]
]
