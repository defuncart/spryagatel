import 'package:isar/isar.dart';

part 'verb.g.dart';

@Collection()
class Verb {
  @Id()
  int? id;

  @Index(caseSensitive: true, unique: true)
  late String infinitiv;

  @Index(caseSensitive: true)
  late String infinitivAccented;

  @AspectConverter()
  late Aspect aspect;

  late List<String> imperative;

  late List<String> past;

  late List<String> presentFuture;
}

enum Aspect {
  imperfective,
  perfective,
}

class AspectConverter extends TypeConverter<Aspect, int> {
  const AspectConverter();

  @override
  Aspect fromIsar(int object) {
    return Aspect.values[object];
  }

  @override
  int toIsar(Aspect object) {
    return object.index;
  }
}
