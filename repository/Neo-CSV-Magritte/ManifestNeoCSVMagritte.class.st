"
# Automate Neo-CSV with Magritte

### 1. Meta-Describe the CSV Field You Care About
- Enable field mapping with `anElementDesciption csvFieldName: aString`. CSV fields which do not have a header corresponding to a Magritte #csvFieldName will be ignored.
- Customize CSV-to-object conversion via `anElementDesciption csvReader: aValuable`.

Example:
```smalltalk
MyPerson>>#descriptionPhone
	<magritteDescription>
	^ MANumberDescription new
		accessor: #phone;
		csvFieldName: 'Phone';
		csvReader: [ :s | (s select: #isDigit) asNumber ];
		yourself
```

### 2. Read a CSV File
- The main entry point is `MyDomainClass class>>#maCSVImporter: aVisitorClass`.
- The header must be a single line with field names. You may manually skip leading irrevelant/blank lines.

Example:
```smalltalk
file :=  self myFolder / 'my_contacts.csv'.
importer :=  MyPerson maCSVImporter: MACSVImporter.
collectionOfMyDomainObjects :=  importer importFile: file
```
"
Class {
	#name : #ManifestNeoCSVMagritte,
	#superclass : #PackageManifest,
	#category : #'Neo-CSV-Magritte-Manifest'
}
