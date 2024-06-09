library underscore;

// TODO Implement this library.
import 'dart:convert';

// TODO :: Array
export "package:underscore/array/chunk.dart";
export "package:underscore/array/compact.dart";
export "package:underscore/array/concat.dart";
export "package:underscore/array/difference.dart";
export "package:underscore/array/drop.dart";
export "package:underscore/array/dropRight.dart";
export 'package:underscore/array/remove.dart';
export 'package:underscore/array/fill.dart';
export 'package:underscore/array/removeAt.dart';
export 'package:underscore/array/join.dart';
export 'package:underscore/array/findIndex.dart';
export 'package:underscore/array/findLastIndex.dart';

// TODO :: String
export 'package:underscore/string/camelCase.dart';
export 'package:underscore/string/capitalize.dart';
export 'package:underscore/string/endsWith.dart';
export 'package:underscore/string/trim.dart';
export 'package:underscore/string/words.dart';

// TODO :: Util
export "package:underscore/util/property.dart";
export "package:underscore/util/matchesProperty.dart";
export "package:underscore/util/matches.dart";

// TODO :: Collection
export "package:underscore/collection/sortBy.dart";
export "package:underscore/collection/size.dart";
export "package:underscore/collection/groupBy.dart";
export "package:underscore/collection/filter.dart";

// TODO :: Lang
export 'package:underscore/lang/isInteger.dart';
export 'package:underscore/lang/toNumber.dart';
export 'package:underscore/lang/toInteger.dart';

// TODO :: Number
export 'package:underscore/number/clamp.dart';
export 'package:underscore/number/inRange.dart';

// TODO :: Math

// TODO :: Object
export "package:underscore/object/get.dart";
export "package:underscore/object/keys.dart";
export "package:underscore/object/values.dart";
export "package:underscore/object/getJsonValue.dart";

/// isNullOrBlank
bool isNullOrBlank(dynamic val) {
  if (val is List) {
    if (val.isEmpty) return true;
    return false;
  } else {
    if (val == null || val == '' || val.toString().isEmpty) return true;
    return false;
  }
}

/// isNumeric
bool isNumeric(s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}

/// differenceFromFirst
differenceFromFirst(first, second) {
  List<dynamic> difference = first.toSet().difference(second.toSet()).toList();
  return difference;
}

/// contains
contains(array, val) {
  if (!isNullOrBlank(array)) return array.contains(val);
  return false;
}

///containsfromList
containsfromList(array, val) {
  if (!isNullOrBlank(array)) return array.values.contains(val);
  return null;
}

///fold
fold(array, {initialValue = 0}) {
  if (!isNullOrBlank(array))
    return array.fold<dynamic>(
        initialValue, (previousValue, element) => previousValue + element);
  return array;
}

///skip
skip(array, skipVal) {
  if (!isNullOrBlank(array)) return array.skip(skipVal);
  return array;
}

///take
take(array, takeVal) {
  if (!isNullOrBlank(array)) return array.take(takeVal);
  return array;
}

///last
last(array) {
  if (!isNullOrBlank(array)) return array.last;
  return array;
}

///first
first(array) {
  if (!isNullOrBlank(array)) return array.first;
}

///isEqual
isEqual(obj1, obj2) {
// return expect(obj1 == obj2, false);
}

/// reverse
reverse(List array) {
  return array.reversed;
}

///slice
slice(List array, index) {
  return array.sublist(index);
}

///subList
subList(List array, start, end) {
  if (end > array.length) {
    end = array.length;
  }
  return array.sublist(start, end);
}

///sort
sort(List array) {
  final sortArray = array.sort();
  return array;
}

///uniq
uniq(List array) {
// convert each item to a string by using JSON encoding
  final jsonList = array.map((item) => jsonEncode(item)).toList();
// using toSet - toList strategy
  final uniqueJsonList = jsonList.toSet().toList();
// convert each item back to the original form using JSON decoding
  final result = uniqueJsonList.map((item) => jsonDecode(item)).toList();
  return result;
}

///uniqBy
uniqBy(List array, key) {
  dynamic uniqArray = [];
  for (var std in array) {
    var index = uniqArray.indexWhere((item) => item[key] == std[key]);
    if (std[key] == null) index = -1; //if key not found
    if (index < 0) uniqArray.add(std);
  }
  return uniqArray;
}
