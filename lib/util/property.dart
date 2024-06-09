/// A function type for accessing properties of objects of type `T`.
///
/// Defines a function signature for accessing properties of objects of type `T`.
/// The function takes an object of type `T` and returns a dynamic value representing the accessed property.
///
/// The `PropertyAccessor<T>` type is typically used with the [property] function to create property accessors.
///
/// Example:
/// ```dart
/// typedef PropertyAccessor<T> = dynamic Function(T object);
///
/// var accessor = property<MyClass>('propertyName');
/// var myObject = MyClass(propertyName: 'value');
/// var propertyValue = accessor(myObject); // Returns 'value'
/// ```
typedef PropertyAccessor<T> = dynamic Function(T object);

/// Creates a property accessor function based on the provided [path].
///
/// Creates a function that accesses properties of objects of type `T` based on the specified [path].
/// The [path] can be either a string representing a property name or a list of strings representing nested property names.
///
/// Returns a `PropertyAccessor<T>` function that can be used to access properties of objects of type `T`.
///
/// Throws an [ArgumentError] if the [path] is not a valid type (either a string or a list of strings).
///
/// Example:
/// ```dart
/// var accessor1 = property<MyClass>('propertyName');
/// var accessor2 = property<MyClass>(['nested', 'propertyName']);
/// var myObject = MyClass(propertyName: 'value', nested: {'propertyName': 'nestedValue'});
/// var value1 = accessor1(myObject); // Returns 'value'
/// var value2 = accessor2(myObject); // Returns 'nestedValue'
/// ```
PropertyAccessor<T> property<T>(dynamic path) {
  if (path is String) {
    List<String> properties = path.split('.');
    return (T object) {
      dynamic result = object;
      for (var prop in properties) {
        if (result is Map<String, dynamic>) {
          result = result[prop];
        } else {
          return null;
        }
      }
      return result;
    };
  } else if (path is List<String>) {
    return (T object) {
      dynamic result = object;
      for (var prop in path) {
        if (result is Map<String, dynamic>) {
          result = result[prop];
        } else {
          return null;
        }
      }
      return result;
    };
  } else {
    throw ArgumentError(
        'Invalid path type. Must be either String or List<String>.');
  }
}
