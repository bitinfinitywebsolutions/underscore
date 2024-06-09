/// Groups the elements of an [Iterable] collection based on a specified [iteratee].
///
/// The [groupBy] function takes an [Iterable] collection and an optional [iteratee].
/// It returns a [Map] where the keys are derived from the elements of the collection
/// according to the [iteratee], and the values are lists of elements that correspond
/// to each key.
///
/// The [iteratee] can be:
/// - `null`: If no iteratee is provided, the elements themselves are used as keys.
/// - A `Function`: If a function is provided, it is applied to each element to determine
///   the corresponding key.
/// - A `String`: If a string is provided, it is used as a key to access properties of
///   elements (assuming elements are maps).
///
/// Throws an [ArgumentError] if the [iteratee] is neither a function nor a string, or if
/// the [iteratee] is a string and the elements are not maps.
///
/// Example usage:
/// ```dart
/// var numbers = [1, 2, 2, 3, 3, 3];
/// var groupedByValue = groupBy(numbers); // {1: [1], 2: [2, 2], 3: [3, 3, 3]}
///
/// var people = [
///   {'name': 'Alice', 'age': 30},
///   {'name': 'Bob', 'age': 30},
///   {'name': 'Charlie', 'age': 40},
/// ];
/// var groupedByAge = groupBy(people, 'age'); // {30: [{'name': 'Alice', 'age': 30}, {'name': 'Bob', 'age': 30}], 40: [{'name': 'Charlie', 'age': 40}]}
///
/// var words = ['apple', 'banana', 'cherry'];
/// var groupedByFirstLetter = groupBy(words, (word) => word[0]); // {'a': ['apple'], 'b': ['banana'], 'c': ['cherry']}
/// ```
///
/// - Parameters:
///   - collection: The [Iterable] collection to group.
///   - iteratee: An optional iteratee which can be a [Function] or a [String].
///
/// - Returns: A [Map] where the keys are derived from the elements of the collection
///   according to the [iteratee], and the values are lists of elements that correspond
///   to each key.
///
/// - Throws: [ArgumentError] if the [iteratee] is invalid.
Map<dynamic, List<dynamic>> groupBy(Iterable collection, [dynamic iteratee]) {
  var result = <dynamic, List<dynamic>>{};

  for (var element in collection) {
    var key;
    if (iteratee == null) {
      key = element;
    } else if (iteratee is Function) {
      key = iteratee(element);
    } else if (iteratee is String) {
      if (element is Map) {
        key = element[iteratee];
      } else {
        throw ArgumentError('Invalid element type for property access');
      }
    } else {
      throw ArgumentError('Invalid iteratee: must be a function or a string');
    }

    if (!result.containsKey(key)) {
      result[key] = [];
    }
    result[key]!.add(element);
  }

  return result;
}
