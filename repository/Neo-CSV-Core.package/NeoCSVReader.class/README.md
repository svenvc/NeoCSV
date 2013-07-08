I am NeoCSVReader.

I read a format that
- is text based (ASCII, Latin1, Unicode)
- consists of records, 1 per line (any line ending convention)
- where records consist of fields separated by a delimiter (comma, tab, semicolon)
- where every record has the same number of fields
- where fields can be quoted should they contain separators or line endings

Without further configuration, records will become Arrays of Strings.

By specifiying a recordClass and fields with optional converters most objects can be read and instanciated correctly.

MIT License.
