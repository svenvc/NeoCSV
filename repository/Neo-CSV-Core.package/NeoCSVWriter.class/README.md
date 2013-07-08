I am NeoCSVWriter.

I write a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, I write record objects whose fields can be enumerated using #do: such as SequenceableCollections

By specifiying fields any object can be written converting and/or quoting each field as needed.

MIT License.