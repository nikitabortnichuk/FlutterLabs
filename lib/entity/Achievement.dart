
class Achievement {

  String _tournamentName;
  int _year;
  int _place;

  Achievement(this._tournamentName, this._year, this._place);

  Achievement.participation(this._tournamentName, this._year);

  String get tournamentName => _tournamentName;

  int get year => _year;

  int get place => _place;

  set tournamentName(String value) {
    _tournamentName = value;
  }

  set place(int value) {
    _place = value;
  }

  set year(int value) {
    _year = value;
  }

  @override
  String toString() {
    return 'Achievement{_tournamentName: $_tournamentName, _year: $_year, _place: $_place}';
  }
}