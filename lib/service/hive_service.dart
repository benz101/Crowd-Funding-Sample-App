import 'package:hive/hive.dart';

class HIVEService<T> {
  final String boxName;
  HIVEService({required this.boxName});

  Future<Box<T>> getBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return (await Hive.openBox<T>(boxName));
    } else {
      return Hive.box<T>(boxName);
    }
  }

  Future<List<T>> getList() async {
    final values = (await getBox()).values;
    return values.toList();
  }

  Future<T?> get(dynamic idName) async => (await getBox()).get(idName);

  Future<Iterable<int>> addAllToList(dynamic model) async {
    (await getBox()).clear();
    return (await getBox()).addAll(model);
  }

  Future<int> addToList(dynamic model) async {
    return await (await getBox()).add(model);
  }

  Future<void> saveToObjectByIndex(int index, T model) async {
    return (await getBox()).putAt(index, model);
  }

  Future<void> saveToObjectById(id, T model) async {
    return (await getBox()).put(id, model);
  }

  Future<void> clearAndSaveToObject(String idName, T model) async {
    await (await getBox()).clear();
    return await (await getBox()).put(idName, model);
  }

  Future<void> update(int index, dynamic model) async {
    return await (await getBox()).putAt(index, model);
  }

  Future<void> delete(String idName) async {
    return await (await getBox()).delete(idName);
  }

  Future<void> deleteAt(int index) async {
    return await (await getBox()).deleteAt(index);
  }

  Future<int> clear() async {
    return await (await getBox()).clear();
  }
}
