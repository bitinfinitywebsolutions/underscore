/// Converts the first character of the given string to uppercase and the remaining
/// characters to lowercase.
///
/// If the input string is empty, it returns the empty string.
///
/// [input] The string to capitalize. Default value is an empty string.
///
/// Returns the capitalized string.
///
/// Example:
/// ```dart
/// print(capitalize('FRED')); // => 'Fred'
/// print(capitalize('fReD')); // => 'Fred'
/// print(capitalize('fred')); // => 'Fred'
/// print(capitalize('')); // => ''
/// print(capitalize()); // => ''
/// ```
String capitalize([String input = '']) {
  if (input.isEmpty) {
    return input;
  }
  return input[0].toUpperCase() + input.substring(1).toLowerCase();
}
