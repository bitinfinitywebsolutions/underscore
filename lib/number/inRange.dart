/// Checks if [number] is between [start] and up to, but not including, [end].
///
/// If [end] is not specified, it's set to [start] with [start] then set to 0.
/// If [start] is greater than [end], the parameters are swapped to support negative ranges.
///
/// Arguments:
///   [number] (number): The number to check.
///   [start=0] (number): The start of the range.
///   [end] (number): The end of the range.
///
/// Returns:
///   (boolean): Returns true if [number] is in the range, else false.
///
/// Example:
/// ```dart
/// inRange(3, 2, 4);     // => true
/// inRange(4, 8);         // => true
/// inRange(4, 2);         // => false
/// inRange(2, 2);         // => false
/// inRange(1.2, 2);       // => true
/// inRange(5.2, 4);       // => false
/// inRange(-3, -2, -6);   // => true
bool inRange(num number, [num start = 0, num? end]) {
  // If end is not specified, set it to start and reset start to 0
  if (end == null) {
    end = start;
    start = 0;
  }

  // If start is greater than end, swap them
  if (start > end) {
    var temp = start;
    start = end;
    end = temp;
  }

  // Check if number is in the range [start, end)
  return number >= start && number < end;
}
