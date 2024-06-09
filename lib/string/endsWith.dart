/// Checks if the given string ends with the specified target string.
///
/// If the [position] parameter is provided, the function checks if the
/// substring from the start of the string up to [position] ends with [target].
/// If [position] is not provided, it defaults to the length of [string].
///
/// The function returns `true` if the substring (or the full string if no
/// [position] is provided) ends with [target], otherwise it returns `false`.
///
/// If [position] is greater than the length of [string], it will be
/// automatically set to the length of the string.
///
/// ### Parameters:
/// - [string] (String): The string to inspect. Defaults to an empty string if not provided.
/// - [target] (String): The string to search for.
/// - [position] (int, optional): The position up to which to search. Defaults to the length of [string].
///
/// ### Returns:
/// - (bool): Returns `true` if the string ends with the target, else `false`.
///
/// ### Example:
/// ```dart
/// bool result1 = endsWith('abc', 'c'); // => true
/// bool result2 = endsWith('abc', 'b'); // => false
/// bool result3 = endsWith('abc', 'b', 2); // => true
bool endsWith(String string, String target, [int? position]) {
  // Set position to string length if not provided
  position ??= string.length;

  // Ensure the position is not greater than the string length
  if (position > string.length) {
    position = string.length;
  }

  // Get the substring from the start to the specified position
  String substring = string.substring(0, position);

  // Check if the substring ends with the target
  return substring.endsWith(target);
}
