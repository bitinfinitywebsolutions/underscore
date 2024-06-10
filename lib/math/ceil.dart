import 'dart:math' as math;

/// Computes [number] rounded up to [precision].
///
/// Arguments:
/// - `number` (number): The number to round up.
/// - `[precision=0]` (number): The precision to round up to. Defaults to 0 if not provided.
///
/// Returns:
/// - (number): Returns the rounded up number.
///
/// Example:
/// ```dart
/// print(ceil(4.006)); // Output: 5
/// print(ceil(6.004, 2)); // Output: 6.01
/// print(ceil(6040, -2)); // Output: 6100
/// ```
num ceil(num number, [int precision = 0]) {
  final multiplier = math.pow(10, precision);
  final adjustedNumber = (number * multiplier).ceil();
  return adjustedNumber / multiplier;
}
