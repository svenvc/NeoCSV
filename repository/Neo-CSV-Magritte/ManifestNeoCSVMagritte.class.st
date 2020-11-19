"
# Automate Neo-CSV with Magritte

### 1. Meta-Describe the CSV Field You Care About
- Enable field mapping with `anElementDesciption csvFieldName: aString`. CSV fields which do not have a header corresponding to a Magritte #csvFieldName will be ignored.
- Customize CSV-to-object conversion via `anElementDesciption csvReader: aValuable`.

Example:
```smalltalk
MyDomainClass>>#descriptionPhone
	<magritteDescription>
	^ MAStringDescription new
		accessor: #phone;
		csvFieldName: 'Phone';
		csvReader: [ :s | s select: #isDigit ];
		yourself
```

### 2. Read a CSV File
- The main entry point is `MyDomainClass class>>#fromCSV: file`.
- For exotic headers (i.e. not a single line with field names), override `MyDomainClass class>>#readCSVHeaderWith:`. You may for example want to skip irrevelant/blank lines).

Example:
```smalltalk
file := self myFolder / 'myfile.csv'.
collectionOfMyDomainObjects := self fromCSV: file
```
where:
```smalltalk
MyDomainClass class>>#readCSVHeaderWith: reader
	^ reader next; next; readHeader
```
"
Class {
	#name : #ManifestNeoCSVMagritte,
	#superclass : #PackageManifest,
	#category : #'Neo-CSV-Magritte-Manifest'
}
