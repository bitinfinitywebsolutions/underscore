/// Returns the size of the given [collection].
///
/// Determines the size of the provided [collection], which can be either a list (`List`), a string (`String`), or a map (`Map`).
/// If the collection is a list or a string, returns the length of the collection.
/// If the collection is a map, returns the number of key-value pairs in the map.
///
/// The [collection] parameter can be of type `List`, `String`, or `Map`.
///
/// Returns an integer representing the size of the collection. If the collection is neither a list, a string, nor a map, returns 0.
///
/// Example:
/// ```dart
/// var myList = [1, 2, 3, 4, 5];
/// var myString = "Hello, world!";
/// var myMap = {'a': 1, 'b': 2, 'c': 3};
/// print(size(myList)); // Output: 5
/// print(size(myString)); // Output: 13
/// print(size(myMap)); // Output: 3
/// ```
///
int size(collection) {
  if (collection is List || collection is String) {
    return collection.length;
  } else if (collection is Map) {
    return collection.length;
  }
  return 0;
}
