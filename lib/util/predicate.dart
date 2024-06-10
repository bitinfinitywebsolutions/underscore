/// A predicate function that takes an element, its index, and the entire list,
/// and returns a boolean indicating whether the element satisfies a condition.
typedef Predicate<T> = bool Function(T value, int index, List<T> array);
