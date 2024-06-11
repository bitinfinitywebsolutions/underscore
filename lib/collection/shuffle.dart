import 'dart:math';

/// Shuffles a list using the Fisher-Yates shuffle algorithm.
///
/// Takes a collection (List) and returns a new list with the elements shuffled.
///
/// Arguments:
/// - [collection] (List): The collection to shuffle.
///
/// Returns:
/// - (List): Returns the new shuffled list.
///
/// Example:
/// ```dart
/// List<int> shuffledList = shuffle([1, 2, 3, 4]);
/// print(shuffledList); // => [4, 1, 3, 2] (output may vary)
/// ```
List<T> shuffle<T>(List<T> collection) {
  final random = Random();
  List<T> shuffled = List<T>.from(collection);

  for (int i = shuffled.length - 1; i > 0; i--) {
    int j = random.nextInt(i + 1);
    T temp = shuffled[i];
    shuffled[i] = shuffled[j];
    shuffled[j] = temp;
  }

  return shuffled;
}
