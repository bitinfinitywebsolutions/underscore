/// Creates a list of grouped elements, where each group contains elements
/// at the same index from the given arrays.
///
/// This function takes multiple arrays as input and creates a new list of
/// lists where the first sublist contains the first elements of the input arrays,
/// the second sublist contains the second elements, and so on.
///
/// Example:
/// ```dart
/// zip(['a', 'b'], [1, 2], [true, false]); // Returns: [['a', 1, true], ['b', 2, false]]
/// ```
///
/// Arguments:
/// - [arrays]: The arrays to process.
///
/// Returns:
/// - A new list of grouped elements.
///
/// Throws:
/// - ArgumentError if no arrays are provided.
///
/// Note:
/// - If the input arrays have different lengths, the resulting list will have
///   the length of the shortest array, and any excess elements in longer arrays
///   will be ignored.
List<List<T?>> zip<T>(List<List<T>> arrays) {
  // Ensure at least one array is provided
  if (arrays.isEmpty) {
    throw ArgumentError('At least one array must be provided.');
  }

  // Determine the length of the shortest array
  final minLength =
      arrays.map((array) => array.length).reduce((a, b) => a < b ? a : b);

  // Create the result list
  final result =
      List.generate(minLength, (index) => List<T?>.filled(arrays.length, null));

  // Fill the result list with grouped elements
  for (var i = 0; i < arrays.length; i++) {
    for (var j = 0; j < minLength; j++) {
      result[j][i] = arrays[i][j];
    }
  }

  return result;
}
