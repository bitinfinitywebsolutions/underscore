/// Splits the given [string] into an array of its words.
///
/// If [pattern] is provided, it is used to match words in the string. If not provided,
/// the default pattern, which matches word boundaries (non-space characters surrounded by word boundaries),
/// is used.
///
/// Example:
/// ```dart
/// words('fred, barney, & pebbles');
/// // => ['fred', 'barney', 'pebbles']
///
/// words('fred, barney, & pebbles', RegExp(r'[^, ]+'));
/// // => ['fred', 'barney', '&', 'pebbles']
/// ```
///
/// Since:
/// 3.0.0
///
/// Arguments:
/// - [string] (String): The string to inspect.
/// - [pattern] (RegExp|string): The pattern to match words.
///
/// Returns:
/// - (List<String>): Returns the words of [string].
List<String?> words(String string, [RegExp? pattern]) {
  pattern ??= RegExp(r'\b\w+\b');
  return pattern.allMatches(string).map((match) => match.group(0)).toList();
}
