/// Retrieves a value from a nested JSON structure based on a provided path.
///
/// The [json] parameter is the JSON object from which to extract the value.
/// The [path] parameter is a dot-separated string representing the path to the desired value.
/// The [defaultValue] parameter is returned if the value is not found or if an error occurs.
///
/// Returns the value from the JSON structure if found; otherwise, returns the [defaultValue].
/// If an error occurs during the process, the [defaultValue] is returned.
///
/// Example usage:
/// ```dart
/// dynamic json = {
///   'foo': {
///     'bar': [
///       {'baz': 'value'}
///     ]
///   }
/// };
/// dynamic result = await getJsonValue(json, 'foo.bar[0].baz', 'default');
/// print(result); // Output: 'value'
/// ```
Future<dynamic> getJsonValue(
    dynamic json, String path, dynamic defaultValue) async {
  try {
    List<String> pathSplitter = path.split(".");

    dynamic currentValue = json;

    for (String part in pathSplitter) {
      if (currentValue == null) {
        return defaultValue;
      }

      if (part.contains('[') && part.contains(']')) {
        int index1 = part.indexOf('[');
        int index2 = part.indexOf(']');
        int index = int.parse(part.substring(index1 + 1, index2));
        part = part.substring(0, index1);

        if (currentValue is Map<String, dynamic> &&
            currentValue.containsKey(part)) {
          currentValue = currentValue[part];
          if (currentValue is List) {
            currentValue = currentValue[index];
          } else {
            return defaultValue; // If not a list but index is provided, return default
          }
        } else {
          return defaultValue; // If part is not in currentValue or not a map, return default
        }
      } else {
        if (currentValue is Map<String, dynamic> &&
            currentValue.containsKey(part)) {
          currentValue = currentValue[part];
        } else {
          return defaultValue; // If part is not in currentValue or not a map, return default
        }
      }
    }

    return currentValue ?? defaultValue;
  } catch (error) {
    // handle error
    return defaultValue;
  }
}
