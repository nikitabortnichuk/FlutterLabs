
class Tree {

  String _name;

  static final Map<String, Tree> _cache = {};

  factory Tree(String name) {
    if(_cache.containsKey(name)){
      return _cache[name];
    } else {
      final tree = Tree._internal(name);
      _cache[name] = tree;
      return tree;
    }
  }

  Tree._internal(this._name);

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Map<String, Tree> get cache => _cache;
}