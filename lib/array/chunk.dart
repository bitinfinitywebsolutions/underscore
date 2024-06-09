/// Creates a new list of chunks of the given [array], each chunk containing
/// [size] number of elements. If the [array] cannot be evenly divided into
/// chunks of size [size], the final chunk will contain the remaining elements.
///
/// Example:
/// ```dart
/// final result1 = _chunk(['a', 'b', 'c', 'd'], 2);
/// // Result: [['a', 'b'], ['c', 'd']]
///
/// final result2 = _chunk(['a', 'b', 'c', 'd'], 3);
/// // Result: [['a', 'b', 'c'], ['d']]
/// ```
///
/// - [array]: The list to process.
/// - [size]: The size of each chunk.
///
/// Returns the new list of chunks.
List<List<T>> _chunk<T>(List<T> array, [int size = 1]) {
  if (size < 1) {
    throw ArgumentError('Size must be greater than 0');
  }

  List<List<T>> chunks = [];
  for (int i = 0; i < array.length; i += size) {
    int end = i + size;
    if (end > array.length) {
      end = array.length;
    }
    chunks.add(array.sublist(i, end));
  }
  return chunks;
}
