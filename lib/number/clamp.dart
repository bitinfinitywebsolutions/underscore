/// Clamps [number] within the inclusive [lower] and [upper] bounds.
///
/// If [number] is less than [lower], [lower] is returned.
/// If [number] is greater than [upper], [upper] is returned.
/// Otherwise, [number] is returned as it falls within the bounds.
///
/// Example:
/// ```dart
/// clamp(-10, -5, 5); // Output: -5
/// clamp(10, -5, 5);  // Output: 5
/// ```
///
/// Since:
///   4.0.0
///
/// Arguments:
///   [number]: The number to clamp.
///   [lower]: The lower bound.
///   [upper]: The upper bound.
///
/// Returns:
///   The clamped number.
///
/// See also:
///  - [RangeError] if [lower] is greater than [upper].
///
num clamp(num number, num lower, num upper) {
  if (lower > upper) {
    throw RangeError('Lower bound must be less than or equal to upper bound.');
  }

  if (number < lower) {
    return lower;
  } else if (number > upper) {
    return upper;
  } else {
    return number;
  }
}
