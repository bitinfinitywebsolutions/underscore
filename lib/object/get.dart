/// Retrieves a value from a nested [Map] or [List] structure based on a given
/// path. If the path does not exist, it returns the provided [defaultValue].
///
/// The path is a dot-separated string indicating the sequence of keys or
/// indices to traverse in the nested structure. For example, given the following
/// structure:
///
/// ```dart
/// final map = {
///   'user': {
///     'name': 'Alice',
///     'address': {
///       'city': 'Wonderland',
///       'zip': 12345
///     }
///   },
///   'posts': [
///     {'title': 'Hello World'},
///     {'title': 'Flutter is Awesome'}
///   ]
/// };
/// ```
///
/// The path 'user.address.city' will return 'Wonderland', and the path
/// 'posts.1.title' will return 'Flutter is Awesome'.
///
/// If the path does not exist, the [defaultValue] is returned. If no
/// [defaultValue] is provided, `null` is returned.
///
/// Example usage:
///
/// ```dart
/// final userCity = get(map, 'user.address.city', 'Unknown'); // 'Wonderland'
/// final postTitle = get(map, 'posts.1.title', 'No Title');   // 'Flutter is Awesome'
/// final invalidPath = get(map, 'invalid.path', 'Not Found'); // 'Not Found'
/// ```
///
/// - Parameters:
///   - map: The [Map] or [List] structure to traverse.
///   - path: The dot-separated string indicating the path to follow.
///   - defaultValue: The value to return if the path does not exist.
///
/// - Returns: The value at the specified path, or [defaultValue] if the path
/// does not exist.
///
/// - Throws: No exceptions are thrown by this function. It will return
/// [defaultValue] if the path cannot be fully resolved.
///
/// - See also:
///   - [Map]
///   - [List]
dynamic get(Map<String, dynamic> map, String path, [dynamic defaultValue]) {
  dynamic result = map;
  final pathSegments = _parsePath(path);

  for (var segment in pathSegments) {
    if (result is Map<String, dynamic> && result.containsKey(segment)) {
      result = result[segment];
    } else if (segment is int && result is List && segment < result.length) {
      result = result[segment];
    } else {
      return defaultValue;
    }
  }
  return result ?? defaultValue;
}

/// Parses the path string into a list of keys and indices.
List<dynamic> _parsePath(String path) {
  final segments = <dynamic>[];
  final regex = RegExp(r'(\w+)|\[(\d+)\]');
  final matches = regex.allMatches(path);

  for (var match in matches) {
    if (match.group(1) != null) {
      segments.add(match.group(1));
    } else if (match.group(2) != null) {
      segments.add(int.parse(match.group(2)!));
    }
  }
  return segments;
}
