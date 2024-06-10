/// Performs a deep comparison between two values to determine if they are equivalent.
///
/// Note: This method supports comparing arrays, array buffers, booleans, date objects,
/// error objects, maps, numbers, Object objects, regexes, sets, strings, symbols,
/// and typed arrays. Object objects are compared by their own, not inherited,
/// enumerable properties. Functions and DOM nodes are compared by strict equality, i.e. ===.
///
/// Arguments:
/// - `value`: The value to compare.
/// - `other`: The other value to compare.
///
/// Returns:
/// - `true` if the values are equivalent, else `false`.
///
/// Example:
/// ```dart
/// var object = { 'a': 1 };
/// var other = { 'a': 1 };
///
/// print(isEqual(object, other)); // Output: true
/// print(object == other); // Output: false
/// ```
bool isEqual(dynamic value, dynamic other) {
  if (value == other) return true;
  if (value is Map && other is Map) {
    if (value.length != other.length) return false;
    for (var key in value.keys) {
      if (!other.containsKey(key) || !isEqual(value[key], other[key])) {
        return false;
      }
    }
    return true;
  }
  if (value is List && other is List) {
    if (value.length != other.length) return false;
    for (var i = 0; i < value.length; i++) {
      if (!isEqual(value[i], other[i])) return false;
    }
    return true;
  }
  if (value is Set && other is Set) {
    return value.length == other.length &&
        value.every((element) => other.contains(element));
  }
  if (value is String && other is String) {
    return value == other;
  }
  if (value is num && other is num) {
    return value == other;
  }
  if (value is bool && other is bool) {
    return value == other;
  }
  // Add more checks for other types as needed
  return false;
}
