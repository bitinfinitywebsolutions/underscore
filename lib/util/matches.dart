import 'package:underscore/util/predicate.dart';

/// Returns a predicate function that checks whether a given map matches the
/// provided [source] map.
///
/// The [source] map contains key-value pairs against which the given map will
/// be tested for equality.
///
/// Example:
/// ```dart
/// Map<String, dynamic> source = {'name': 'John', 'age': 30};
/// var predicate = matches(source);
///
/// Map<String, dynamic> person1 = {'name': 'John', 'age': 30};
/// Map<String, dynamic> person2 = {'name': 'Jane', 'age': 25};
///
/// print(predicate(person1)); // Output: true
/// print(predicate(person2)); // Output: false
/// ```
///
/// - Parameter source: A map containing key-value pairs to match against.
/// - Returns: A predicate function that returns `true` if the given map matches
/// the source map, `false` otherwise.
Predicate<Map<String, dynamic>> matches(Map<String, dynamic> source) {
  return (value, index, array) {
    for (var key in source.keys) {
      if (value[key] != source[key]) {
        return false;
      }
    }
    return true;
  };
}
