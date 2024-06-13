/// Converts the given value to an integer.
///
/// Arguments:
/// - `value`: The value to convert.
///
/// Returns:
/// - The converted integer.
///
/// Example:
/// ```dart
/// var result1 = _.toInteger(3.2);
/// print(result1); // Output: 3
///
/// var result2 = _.toInteger(double.minPositive);
/// print(result2); // Output: 0
///
/// In Dart, integers are represented as 64-bit signed integers, and the maximum value is indeed base (2) to the power of the exponent (63) − 1, which is 9223372036854775807
///
/// var result3 = _.toInteger(double.infinity);
/// print(result3); // Output: 9223372036854775807
///
/// var result4 = _.toInteger('3.2');
/// print(result4); // Output: 3
/// ```
int toInteger(dynamic value) {
  if (value is double) {
    if (value.isFinite) {
      return value.toInt();
    } else if (value.isNaN) {
      return 0; // or any other value you prefer for NaN
    } else {
      return value.isNegative
          ? -9223372036854775808
          : 9223372036854775807; // return min or max value for Infinity
    }
  } else if (value is String) {
    double parsedDouble = double.tryParse(value) ?? 0.0;
    return parsedDouble.toInt();
  } else if (value is num) {
    return value.toInt();
  } else if (value is bool) {
    return value ? 1 : 0;
  } else {
    throw ArgumentError("Invalid value: $value");
  }
}
