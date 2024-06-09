import '../underscore.dart';

/// Joins the elements of an array into a single string using the specified separator.
///
/// If the array is null or empty, returns the array itself.
///
/// Parameters:
///   array (List): The array to join.
///   takeVal (dynamic): The separator to use in joining the elements.
///
/// Returns:
///   String: The joined string, or the original array if it's null or empty.
String _join(List array, dynamic takeVal) {
  if (array.isNotEmpty && !isNullOrBlank(array)) {
    return array.join(takeVal);
  }
  return array.toString();
}
