/// Removes leading and trailing whitespace or specified characters from [str].
///
/// If [chars] is provided, it specifies the characters to trim.
///
/// Returns the trimmed string.
///
/// Example:
/// ```dart
/// print(trim('  abc  ')); // Output: 'abc'
/// print(trim('-_-abc-_-', '_-')); // Output: 'abc'
/// ```
String trim(String str, [String chars = ""]) {
  if (chars.isEmpty) {
    return str.replaceAll(RegExp(r'^\s+|\s+$'), '');
  } else {
    final pattern =
        '^[' + RegExp.escape(chars) + r']+|[' + RegExp.escape(chars) + r']+$';
    return str.replaceAll(RegExp(pattern), '');
  }
}
