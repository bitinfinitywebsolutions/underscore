/// Creates a new map from the given [keys] and [values] arrays.
///
/// This function is like _.fromPairs, but it accepts two arrays
/// instead of an array of pairs. It creates a new map where the keys are taken
/// from the [keys] array and the corresponding values are taken from the [values]
/// array based on their positions.
///
/// Example:
/// ```dart
/// zipObject(['a', 'b'], [1, 2]); // {'a': 1, 'b': 2}
/// ```
Map<K, V> zipObject<K, V>(List<K> keys, List<V> values) {
  if (keys.length != values.length && !(keys.isEmpty && values.every((element) => element == null))) {
    throw ArgumentError('Keys and values arrays must have the same length.');
  }

  Map<K, V> result = {};

  for (int i = 0; i < keys.length; i++) {
    result[keys[i]] = values[i];
  }

  return result;
}

