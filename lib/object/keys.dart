// List<String> keys(dynamic object) {
//   // Reflect the object to get its instance members
//   var instanceMirror = reflect(object);
//   var classMirror = instanceMirror.type;
//
//   // Filter only the instance members (i.e., non-static members)
//   return classMirror.declarations.values
//       .where((declaration) =>
//           declaration is VariableMirror && !declaration.isStatic)
//       .map((declaration) => MirrorSystem.getName(declaration.simpleName))
//       .toList();
// }
List<String> keys(dynamic object) {
  if (object == null) {
    return [];
  }

  // Check if the input is a Map, which is a common case for objects in Dart
  if (object is Map) {
    return object.keys.map((key) => key.toString()).toList();
  }

  return [];
}
