import 'package:project1/classWithFactory/Tree.dart';
import 'package:project1/entity/Achievement.dart';
import 'package:project1/entity/Basketball.dart';
import 'package:project1/entity/Football.dart';
import 'package:project1/entity/Sport.dart';
import 'package:project1/entity/Sportsman.dart';
import 'package:project1/functions/functions.dart';
import 'package:project1/service/SportsmanService.dart';

void main(List<String> arguments) {
  //practiceOOP();
  //servicePractice();
  //factoryPractice();
  //functionsPractice();
  collectionsPractise();
}

void practiceOOP() {
  var achievement1 = Achievement('World Champ', 2019, 1);
  var achievement2 = Achievement('European Champ', 2020, 3);
  var achievementList = <Achievement>[achievement1, achievement2];

  var football = Football();
  var basketball = Basketball();

  var footballPlayer1 =
      Sportsman.personalData(football, achievementList, 'Leo', 'Messi', 30);

  var basketballPlayer1 = Sportsman.sport(basketball);
  basketballPlayer1.setFullNameWithNamedParams(
      firstName: 'Kobe', lastName: 'Bryant');

  var basketballPlayer2 = Sportsman.log(basketball, []);
  basketballPlayer2.setFullNameWithPositionalParams('Lebron', 'James');

  basketballPlayer1.createAchievement('Ukraine Champ', 2018); //only participation
  basketballPlayer2.createAchievement('NBA Champ', 2019, 2); //with place

  print('$footballPlayer1\n');
  print('$basketballPlayer1\n');
  print('$basketballPlayer2\n');

  var emptyAchievementList = <Achievement>[];
  var footballPlayer2 =
      Sportsman.achievements(emptyAchievementList); //assert fail
}

void servicePractice() {
  var service = SportsmanService();

  //service.findFootballersByName('Nik');

  //print(service.processBasketballPlayer(2));

  service.printLastNames();


}

void factoryPractice() {

  var oak1 = Tree('Oak');
  var oak2 = Tree('Oak');

  var birch1 = Tree('Birch');

  var pine1 = Tree('Pine');
  var pine2 = Tree('Pine');
  var pine3 = Tree('Pine');

  print('Cache length: ' + oak1.cache.length.toString()); // expected: 3
}

void functionsPractice() {
  //print(hello('Nik'));

  var addHello = concat(' Hello');
  var addBye = concat(' Bye-Bye');
  print(addHello('Friend'));
  print(addBye('Enemy'));
}

void collectionsPractise() {
  var list = ['s1', 's2', 's3'];
  print(list.runtimeType);
  for (var s in list) {
    print(s);
  }

  var list1 = ['2s', ...?list];
  list1.map((e) => e + 'mapped')
      .where((element) => element.contains('2'))
      .forEach((e) => print(e));


  var set = {1, 2, 3};
  print(set.runtimeType);
  var setStr = <String>{};
  setStr.add('value');

  var map = {};
  print(map.runtimeType);

  var map1 = {1: 'one', 2: 'two'};
  map1.putIfAbsent(3, () => 'three');
  map1[4] = 'four';
  print(map1);

  var emptyMap = <int, String>{};
  print(emptyMap.runtimeType);
}
