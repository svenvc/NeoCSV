# NeoCSV

NeoCSV is an elegant and efficient standalone Smalltalk framework to read and write CSV converting to or from Smalltalk objects.

[![Build Status](https://travis-ci.org/svenvc/NeoCSV.svg?branch=master)](https://travis-ci.org/svenvc/NeoCSV)

MIT Licensed.

Go ahead and read the [NeoCSV paper](https://github.com/svenvc/docs/blob/master/neo/neo-csv-paper.md).

Basically, NeoCSV deals with a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

https://en.wikipedia.org/wiki/Comma-separated_values

## Installation

You can load NeoCSV using Metacello

```Smalltalk
Metacello new
  repository: 'github://svenvc/NeoCSV/repository';
  baseline: 'NeoCSV';
  load.
```

You can use the following dependency from your own Metacello configuration or baseline

```Smalltalk
spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
```

