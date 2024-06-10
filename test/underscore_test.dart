import 'package:underscore/underscore.dart' as _;

void main() {
  var users = [
    {'user': 'barney', 'age': 36, 'active': true},
    {'user': 'fred', 'age': 40, 'active': false}
  ];
  print(_.filter(users, (o) => !(o['active'])));
}
