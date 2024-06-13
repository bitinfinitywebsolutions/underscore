import 'package:underscore/util/predicate.dart';

/// Creates a predicate function that checks if a given property of an object
/// matches a specified value.
///
/// This function returns a predicate (a function that returns a boolean value)
/// that takes a value, an index, and an array (though it only uses the value)
/// and checks if the value is a map containing a specified property with a
/// specified value. The predicate can be used to filter collections.
///
/// The `property` parameter is a list where the first element is the key of the
/// property to check and the second element is the value to match against.
///
/// Example:
/// ```dart
/// var data = [
///   {'name': 'Alice', 'age': 30},
///   {'name': 'Bob', 'age': 25},
///   {'name': 'Charlie', 'age': 30},
/// ];
///
/// var predicate = matchesProperty(['age', 30]);
/// var result = data.where((element) => predicate(element, 0, data)).toList();
///
/// print(result); // [{'name': 'Alice', 'age': 30}, {'name': 'Charlie', 'age': 30}]
/// ```
///
/// Type Parameters:
/// - `T`: The type of the elements in the collection.
///
/// Parameters:
/// - `property` (`List<dynamic>`): A list where the first element is the key to
///   check in the map, and the second element is the value to match.
///
/// Returns:
/// - `Predicate<T>`: A function that takes a value, an index, and an array,
///   and returns `true` if the value is a map containing the specified property
///   with the specified value, otherwise returns `false`.
Predicate<T> matchesProperty<T>(List property) {
  return (value, index, array) {
    if (property.length != 2) {
      return false;
    }
    if (value is Map<String, dynamic>) {
      return value[property[0]] == property[1];
    }
    return false;
  };
}
