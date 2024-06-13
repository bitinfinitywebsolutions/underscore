/// Checks if [value] is an integer.
///
/// This method checks whether the provided [value] is an integer. It first checks if the [value] is of type `int`. If the [value] is not of type `int`, it then checks if it's of type `double`, and if so, verifies if it's equal to its truncated version (i.e., no decimal part). If neither condition holds, it returns `false`.
///
/// Note: This method is based on JavaScript's Number.isInteger function.
///
/// Arguments:
///   [value] (*): The value to check.
///
/// Returns:
///   [bool]: Returns `true` if [value] is an integer, else `false`.
///
/// Example:
/// ```dart
/// print(isInteger(3)); // true
/// print(isInteger(double.minPositive)); // false
/// print(isInteger(double.infinity)); // false
/// print(isInteger('3')); // false
/// ```
bool isInteger(dynamic value) {
  if (value is int) {
    return true;
  }
  if (value is double) {
    if (value.isInfinite || value.isNaN || value.abs() > (1 << 53)) {
      return false;
    }
    return value.truncateToDouble() == value;
  }
  return false;
}
