/// Converts a given string to camel case format.
///
/// Camel case format means the first word is in lowercase and each subsequent
/// word starts with a capital letter without any spaces or special characters
/// separating them.
///
/// For example:
/// ```dart
/// print(camelCase('Foo Bar'));         // Output: 'fooBar'
/// print(camelCase('--foo-bar--'));     // Output: 'fooBar'
/// print(camelCase('__FOO_BAR__'));     // Output: 'fooBar'
/// print(camelCase(''));                // Output: ''
String camelCase(String input) {
  if (input.isEmpty) return '';

  // Split the string by non-alphanumeric characters
  List<String> words = input
      .split(RegExp(r'[^a-zA-Z0-9]'))
      .where((word) => word.isNotEmpty)
      .toList();

  // If there are no words after splitting, return an empty string
  if (words.isEmpty) return '';

  // Convert the first word to lowercase
  String camelCased = words[0].toLowerCase();

  // Convert the rest of the words to capitalized form and concatenate them
  for (int i = 1; i < words.length; i++) {
    String word = words[i];
    // If the word starts with a number, just append it as is
    if (RegExp(r'^[0-9]').hasMatch(word)) {
      camelCased += word;
    } else {
      camelCased += word[0].toUpperCase() + word.substring(1).toLowerCase();
    }
  }

  return camelCased;
}
