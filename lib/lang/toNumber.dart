/// Converts the given value to a number.
///
/// Arguments:
/// - `value`: The value to process.
///
/// Returns:
/// - The number converted from the input value.
///
/// Example:
/// ```dart
/// var result1 = _.toNumber(3.2);
/// print(result1); // Output: 3.2
///
/// var result2 = _.toNumber(double.minPositive);
/// print(result2); // Output: 5.0e-324
///
/// var result3 = _.toNumber(double.infinity);
/// print(result3); // Output: Infinity
///
/// var result4 = _.toNumber('3.2');
/// print(result4); // Output: 3.2
/// ```
double toNumber(dynamic value) {
  if (value is String) {
    return double.parse(value);
  } else if (value is num) {
    return value.toDouble();
  } else if (value is bool) {
    // Handling boolean input gracefully
    return value ? 1 : 0;
  } else {
    throw ArgumentError("Invalid value: $value");
  }
}
