import 'package:flutter_test/flutter_test.dart';
import 'package:underscore/underscore.dart';

void main() {
  var users = [
    { 'user': 'barney', 'active': true },
    { 'user': 'fred',   'active': false },
    { 'user': 'pebbles', 'active': false }
  ];

  var index1 = findLastIndex(users, (o) => o['user'] == 'pebbles');
  print(index1); // Output: 2

  var index2 = findLastIndex(users, (o) => o['user'] == 'barney' && o['active'] == true);
  print(index2); // Output: 0

  var index3 = findLastIndex(users, (o) => o['active'] == false);
  print(index3); // Output: 2

  var index4 = findLastIndex(users, (o) => o['active']);
  print(index4); // Output: 0

  group('findLastIndex', () {
    test('should return the index of the last element matching the predicate', () {
      var users = [
        { 'user': 'barney', 'active': true },
        { 'user': 'fred',   'active': false },
        { 'user': 'pebbles', 'active': false }
      ];

      var index1 = findLastIndex(users, (o) => o['user'] == 'pebbles');
      expect(index1, 2);

      var index2 = findLastIndex(users, (o) => o['user'] == 'barney' && o['active'] == true);
      expect(index2, 0);

      var index3 = findLastIndex(users, (o) => o['active'] == false);
      expect(index3, 2);

      var index4 = findLastIndex(users, (o) => o['active']);
      expect(index4, 0);
    });

    test('should return -1 if no element matches the predicate', () {
      var users = [
        { 'user': 'barney', 'active': true },
        { 'user': 'fred',   'active': false }
      ];

      var index = findLastIndex(users, (o) => o['user'] == 'wilma');
      expect(index, -1);
    });

    test('should return -1 if array is empty', () {
      var emptyList = [];
      var index = findLastIndex(emptyList);
      expect(index, -1);
    });

    test('should start searching from the specified index', () {
      var users = [
        { 'user': 'barney', 'active': true },
        { 'user': 'fred',   'active': false },
        { 'user': 'pebbles', 'active': false }
      ];

      var index1 = findLastIndex(users, (o) => o['active'], 1);
      expect(index1, 1);

      var index2 = findLastIndex(users, (o) => o['active'], 0);
      expect(index2, 0);
    });

    test('should handle negative fromIndex', () {
      var users = [
        { 'user': 'barney', 'active': true },
        { 'user': 'fred',   'active': false },
        { 'user': 'pebbles', 'active': false }
      ];

      var index = findLastIndex(users, (o) => o['active'], -2);
      expect(index, 0);
    });
  });
}
