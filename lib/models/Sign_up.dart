import 'DataBaseHelperSc.dart';

class SignUpClass {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  SignUpClass(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password});
  toJson() {
    return {
      DBHelperSc.columnIdSign: id,
      DBHelperSc.columnFirstName: firstName,
      DBHelperSc.columnLastName: lastName,
      DBHelperSc.columnEmail: email,
      DBHelperSc.columnPhone: phone,
      DBHelperSc.columnPassword: password,
    };
  }

  SignUpClass.fromJson(Map map) {
    id = map[DBHelperSc.columnIdSign];
    firstName = map[DBHelperSc.columnFirstName];
    lastName = map[DBHelperSc.columnLastName];
    email = map[DBHelperSc.columnEmail];
    phone = map[DBHelperSc.columnPhone];
    password = map[DBHelperSc.columnPassword];
  }
}
