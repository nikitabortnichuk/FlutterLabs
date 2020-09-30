import 'package:meta/meta.dart';

mixin PersonalData {
  String _firstName;
  String _lastName;
  int _age;

  String get firstName => _firstName;

  String get lastName => _lastName;

  int get age => _age;

  String get fullName => _firstName + ' ' + _lastName;

  set firstName(String firstName) {
    _firstName = firstName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }

  set age(int age) {
    _age = age;
  }

  void setFullNameWithNamedParams({@required String firstName, String lastName}) {
    _firstName = firstName;
    _lastName = lastName;
  }

  void setFullNameWithPositionalParams(String firstName, [String lastName = '']) {
    _firstName = firstName;
    _lastName = lastName;
  }



}
