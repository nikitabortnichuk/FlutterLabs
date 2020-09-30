import 'package:project1/entity/Achievement.dart';
import 'package:project1/entity/Basketball.dart';
import 'package:project1/entity/Football.dart';
import 'package:project1/entity/Sport.dart';
import 'package:project1/entity/Sportsman.dart';
import 'package:meta/meta.dart';


class SportsmanService {
  
  final Map<Sport, List<Sportsman>> _sportsmenMap = {};
  final _football = Football();
  final _basketball = Basketball();

  SportsmanService(){
    _createSportsmen();
  }

  void _createSportsmen(){

    var sportsmen1 = Sportsman.sport(_football);
    sportsmen1.firstName = 'Nik';
    sportsmen1.lastName = 'Bort';
    var sportsmen2 = Sportsman.sport(_basketball);
    sportsmen2.firstName = 'Nik';
    sportsmen2.lastName = 'ln2';
    var sportsmen3 = Sportsman.sport(_football);
    sportsmen3.firstName = 'sportsmen3';
    var sportsmen4 = Sportsman.sport(_basketball);
    sportsmen4.firstName = 'sportsmen4';
    sportsmen4.lastName = 'ln4';
    var sportsmen5 = Sportsman.sport(_football);
    sportsmen5.firstName = 'sportsmen5';
    var sportsmen6 = Sportsman.sport(_basketball);
    sportsmen6.firstName = 'sportsmen6';
    sportsmen6.lastName = 'ln6';

    var footballers = <Sportsman>[sportsmen1, sportsmen3, sportsmen5];
    var basketballers = <Sportsman>[sportsmen2, sportsmen4, sportsmen6];

    _sportsmenMap[_football] = footballers;
    _sportsmenMap[_basketball] = basketballers;
  }

  void findFootballersByName(String name){
    var footballers = _sportsmenMap[_football];

    name ?? print('Be careful! Name is null!');

    name ??= 'Default';

    footballers.where((e) => e.firstName == name ?? 'default').toList().forEach((element) => print(element));
  }

  Sportsman processBasketballPlayer(int index) {
    var achievement = Achievement('World Championship', 2019, 1);

    var basketballers = _sportsmenMap[_basketball];
    var basketballer = basketballers[index];

    return basketballer
      ..firstName='Vasia'
      ..lastName='Pupkin'
      ..age=21
      ..isLooser()
      ..achieve(achievement);
  }

  String _getSportsmenLastNameToUpper(Sportsman sportsman){
    return sportsman.lastName?.toUpperCase();
  }

  void printLastNames() {
    _sportsmenMap.values
        .reduce((l1, l2) => l1 + l2)
        .forEach((element) =>print(_getSportsmenLastNameToUpper(element)));
  }
}