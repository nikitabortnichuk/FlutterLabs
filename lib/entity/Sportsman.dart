import 'package:project1/entity/Achievement.dart';
import 'package:project1/entity/PersonalData.dart';
import 'package:project1/entity/Sport.dart';

class Sportsman with PersonalData {
  Sport _sport;
  List<Achievement> _achievementList = [];

  Sportsman(this._sport, this._achievementList);

  Sportsman.personalData(this._sport, this._achievementList, String firstName, String lastName, int age) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.age = age;
  }

  Sportsman.log(this._sport, this._achievementList) {
    print('New Sportsman created');
  }

  Sportsman.object(Sport sport, List<Achievement> achievementList)
      : _sport = sport,
        _achievementList = achievementList;

  Sportsman.sport(this._sport);

  Sportsman.achievements(this._achievementList)
      : assert(_achievementList.isNotEmpty);

  Sport get sport => _sport;

  List<Achievement> get achievementList => _achievementList;

  set sport(Sport value) => _sport = value;

  set achievementList(List<Achievement> value) => _achievementList = value;

  @override
  String toString() {
    return 'Sportsman{\n'
        'firstName: $firstName,\n'
        'lastName: $lastName,\n'
        'age: $age,\n'
        'sport: $_sport,\n'
        'achievementList: $_achievementList}';
  }

  void achieve(Achievement achievement) => _achievementList.add(achievement);

  bool isLooser() => _achievementList.isEmpty;

  void createAchievement(String tournamentName, int year, [int place]) {
    var achievement = place == null
        ? Achievement.participation(tournamentName, year)
        : Achievement(tournamentName, year, place);

    achieve(achievement);
  }
}
