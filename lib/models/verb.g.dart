// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verb.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, invalid_use_of_protected_member

extension GetVerbCollection on Isar {
  IsarCollection<Verb> get verbs {
    return getCollection('Verb');
  }
}

final VerbSchema = CollectionSchema(
  name: 'Verb',
  schema:
      '{"name":"Verb","properties":[{"name":"infinitiv","type":"String"},{"name":"infinitivAccented","type":"String"},{"name":"aspect","type":"Long"},{"name":"imperative","type":"StringList"},{"name":"past","type":"StringList"},{"name":"presentFuture","type":"StringList"}],"indexes":[{"name":"infinitiv","unique":true,"properties":[{"name":"infinitiv","type":"Hash","caseSensitive":true}]},{"name":"infinitivAccented","unique":false,"properties":[{"name":"infinitivAccented","type":"Hash","caseSensitive":true}]}],"links":[]}',
  adapter: const _VerbAdapter(),
  idName: 'id',
  propertyIds: {
    'infinitiv': 0,
    'infinitivAccented': 1,
    'aspect': 2,
    'imperative': 3,
    'past': 4,
    'presentFuture': 5
  },
  indexIds: {'infinitiv': 0, 'infinitivAccented': 1},
  indexTypes: {
    'infinitiv': [
      NativeIndexType.stringHash,
    ],
    'infinitivAccented': [
      NativeIndexType.stringHash,
    ]
  },
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) => obj.id,
  version: 0,
);

class _VerbAdapter extends IsarTypeAdapter<Verb> {
  const _VerbAdapter();

  static const _AspectConverter = AspectConverter();

  @override
  int serialize(IsarCollection<Verb> collection, RawObject rawObj, Verb object,
      List<int> offsets,
      [int? existingBufferSize]) {
    rawObj.id = object.id ?? Isar.minId;
    var dynamicSize = 0;
    final value0 = object.infinitiv;
    final _infinitiv = BinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += _infinitiv.length;
    final value1 = object.infinitivAccented;
    final _infinitivAccented = BinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += _infinitivAccented.length;
    final value2 = _VerbAdapter._AspectConverter.toIsar(object.aspect);
    final _aspect = value2;
    final value3 = object.imperative;
    dynamicSize += (value3.length) * 8;
    final bytesList3 = <Uint8List>[];
    for (var str in value3) {
      final bytes = BinaryWriter.utf8Encoder.convert(str);
      bytesList3.add(bytes);
      dynamicSize += bytes.length;
    }
    final _imperative = bytesList3;
    final value4 = object.past;
    dynamicSize += (value4.length) * 8;
    final bytesList4 = <Uint8List>[];
    for (var str in value4) {
      final bytes = BinaryWriter.utf8Encoder.convert(str);
      bytesList4.add(bytes);
      dynamicSize += bytes.length;
    }
    final _past = bytesList4;
    final value5 = object.presentFuture;
    dynamicSize += (value5.length) * 8;
    final bytesList5 = <Uint8List>[];
    for (var str in value5) {
      final bytes = BinaryWriter.utf8Encoder.convert(str);
      bytesList5.add(bytes);
      dynamicSize += bytes.length;
    }
    final _presentFuture = bytesList5;
    final size = dynamicSize + 58;

    late int bufferSize;
    if (existingBufferSize != null) {
      if (existingBufferSize < size) {
        malloc.free(rawObj.buffer);
        rawObj.buffer = malloc(size);
        bufferSize = size;
      } else {
        bufferSize = existingBufferSize;
      }
    } else {
      rawObj.buffer = malloc(size);
      bufferSize = size;
    }
    rawObj.buffer_length = size;
    final buffer = rawObj.buffer.asTypedList(size);
    final writer = BinaryWriter(buffer, 58);
    writer.writeBytes(offsets[0], _infinitiv);
    writer.writeBytes(offsets[1], _infinitivAccented);
    writer.writeLong(offsets[2], _aspect);
    writer.writeStringList(offsets[3], _imperative);
    writer.writeStringList(offsets[4], _past);
    writer.writeStringList(offsets[5], _presentFuture);
    return bufferSize;
  }

  @override
  Verb deserialize(IsarCollection<Verb> collection, int id, BinaryReader reader,
      List<int> offsets) {
    final object = Verb();
    object.id = id;
    object.infinitiv = reader.readString(offsets[0]);
    object.infinitivAccented = reader.readString(offsets[1]);
    object.aspect =
        _VerbAdapter._AspectConverter.fromIsar(reader.readLong(offsets[2]));
    object.imperative = reader.readStringList(offsets[3]) ?? [];
    object.past = reader.readStringList(offsets[4]) ?? [];
    object.presentFuture = reader.readStringList(offsets[5]) ?? [];
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, BinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (_VerbAdapter._AspectConverter.fromIsar(reader.readLong(offset)))
            as P;
      case 3:
        return (reader.readStringList(offset) ?? []) as P;
      case 4:
        return (reader.readStringList(offset) ?? []) as P;
      case 5:
        return (reader.readStringList(offset) ?? []) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }
}

extension VerbByIndex on IsarCollection<Verb> {
  Future<Verb?> getByinfinitiv(String infinitiv) {
    // ignore: invalid_use_of_protected_member
    return getAllByIndex('infinitiv', [
      [infinitiv]
    ]).then((e) => e[0]);
  }

  Verb? getByinfinitivSync(String infinitiv) {
    // ignore: invalid_use_of_protected_member
    return getAllByIndexSync('infinitiv', [
      [infinitiv]
    ])[0];
  }

  Future<bool> deleteByinfinitiv(String infinitiv) {
    // ignore: invalid_use_of_protected_member
    return deleteAllByIndex('infinitiv', [
      [infinitiv]
    ]).then((e) => e == 1);
  }

  bool deleteByinfinitivSync(String infinitiv) {
    // ignore: invalid_use_of_protected_member
    return getAllByIndexSync('infinitiv', [
          [infinitiv]
        ]) ==
        1;
  }

  Future<List<Verb?>> getAllByinfinitiv(List<List<dynamic>> values) {
    // ignore: invalid_use_of_protected_member
    return getAllByIndex('infinitiv', values);
  }

  List<Verb?> getAllByinfinitivSync(List<List<dynamic>> values) {
    // ignore: invalid_use_of_protected_member
    return getAllByIndexSync('infinitiv', values);
  }

  Future<int> deleteAllByinfinitiv(List<List<dynamic>> values) {
    // ignore: invalid_use_of_protected_member
    return deleteAllByIndex('infinitiv', values);
  }

  int deleteAllByinfinitivSync(List<List<dynamic>> values) {
    // ignore: invalid_use_of_protected_member
    return deleteAllByIndexSync('infinitiv', values);
  }
}

extension VerbQueryWhereSort on QueryBuilder<Verb, Verb, QWhere> {
  QueryBuilder<Verb, Verb, QAfterWhere> anyId() {
    return addWhereClause(WhereClause(indexName: '_id'));
  }

  QueryBuilder<Verb, Verb, QAfterWhere> anyInfinitiv() {
    return addWhereClause(WhereClause(indexName: 'infinitiv'));
  }

  QueryBuilder<Verb, Verb, QAfterWhere> anyInfinitivAccented() {
    return addWhereClause(WhereClause(indexName: 'infinitivAccented'));
  }
}

extension VerbQueryWhere on QueryBuilder<Verb, Verb, QWhereClause> {
  QueryBuilder<Verb, Verb, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClause(WhereClause(
        indexName: '_id',
        upper: [id],
        includeUpper: false,
      )).addWhereClause(WhereClause(
        indexName: '_id',
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClause(WhereClause(
        indexName: '_id',
        lower: [id],
        includeLower: false,
      )).addWhereClause(WhereClause(
        indexName: '_id',
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> idIsNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      upper: [null],
      includeUpper: true,
      lower: [null],
      includeLower: true,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> idIsNotNull() {
    return addWhereClause(WhereClause(
      indexName: '_id',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> infinitivEqualTo(
      String infinitiv) {
    return addWhereClause(WhereClause(
      indexName: 'infinitiv',
      lower: [infinitiv],
      includeLower: true,
      upper: [infinitiv],
      includeUpper: true,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> infinitivNotEqualTo(
      String infinitiv) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClause(WhereClause(
        indexName: 'infinitiv',
        upper: [infinitiv],
        includeUpper: false,
      )).addWhereClause(WhereClause(
        indexName: 'infinitiv',
        lower: [infinitiv],
        includeLower: false,
      ));
    } else {
      return addWhereClause(WhereClause(
        indexName: 'infinitiv',
        lower: [infinitiv],
        includeLower: false,
      )).addWhereClause(WhereClause(
        indexName: 'infinitiv',
        upper: [infinitiv],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> infinitivAccentedEqualTo(
      String infinitivAccented) {
    return addWhereClause(WhereClause(
      indexName: 'infinitivAccented',
      lower: [infinitivAccented],
      includeLower: true,
      upper: [infinitivAccented],
      includeUpper: true,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterWhereClause> infinitivAccentedNotEqualTo(
      String infinitivAccented) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClause(WhereClause(
        indexName: 'infinitivAccented',
        upper: [infinitivAccented],
        includeUpper: false,
      )).addWhereClause(WhereClause(
        indexName: 'infinitivAccented',
        lower: [infinitivAccented],
        includeLower: false,
      ));
    } else {
      return addWhereClause(WhereClause(
        indexName: 'infinitivAccented',
        lower: [infinitivAccented],
        includeLower: false,
      )).addWhereClause(WhereClause(
        indexName: 'infinitivAccented',
        upper: [infinitivAccented],
        includeUpper: false,
      ));
    }
  }
}

extension VerbQueryFilter on QueryBuilder<Verb, Verb, QFilterCondition> {
  QueryBuilder<Verb, Verb, QAfterFilterCondition> idIsNull() {
    return addFilterCondition(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> idEqualTo(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> idGreaterThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> idLessThan(
    int? value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'id',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'infinitiv',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'infinitiv',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'infinitiv',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return addFilterCondition(FilterCondition.between(
      property: 'infinitivAccented',
      lower: lower,
      upper: upper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'infinitivAccented',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> infinitivAccentedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'infinitivAccented',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> aspectEqualTo(
    Aspect value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'aspect',
      value: _VerbAdapter._AspectConverter.toIsar(value),
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> aspectGreaterThan(
    Aspect value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'aspect',
      value: _VerbAdapter._AspectConverter.toIsar(value),
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> aspectLessThan(
    Aspect value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'aspect',
      value: _VerbAdapter._AspectConverter.toIsar(value),
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> aspectBetween(
    Aspect lower,
    Aspect upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'aspect',
      lower: _VerbAdapter._AspectConverter.toIsar(lower),
      upper: _VerbAdapter._AspectConverter.toIsar(upper),
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyEqualTo(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'imperative',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyGreaterThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'imperative',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyLessThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'imperative',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyBetween(
    String lower,
    String upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'imperative',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'imperative',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'imperative',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'imperative',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> imperativeAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'imperative',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyEqualTo(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'past',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyGreaterThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'past',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyLessThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'past',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyBetween(
    String lower,
    String upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'past',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'past',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyEndsWith(String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'past',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyContains(String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'past',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> pastAnyMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'past',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyEqualTo(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.eq,
      property: 'presentFuture',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyGreaterThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.gt,
      property: 'presentFuture',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyLessThan(
    String value,
  ) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.lt,
      property: 'presentFuture',
      value: value,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyBetween(
    String lower,
    String upper,
  ) {
    return addFilterCondition(FilterCondition.between(
      property: 'presentFuture',
      lower: lower,
      upper: upper,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyStartsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.startsWith,
      property: 'presentFuture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyEndsWith(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.endsWith,
      property: 'presentFuture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.contains,
      property: 'presentFuture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Verb, Verb, QAfterFilterCondition> presentFutureAnyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterCondition(FilterCondition(
      type: ConditionType.matches,
      property: 'presentFuture',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension VerbQueryWhereSortBy on QueryBuilder<Verb, Verb, QSortBy> {
  QueryBuilder<Verb, Verb, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByInfinitiv() {
    return addSortByInternal('infinitiv', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByInfinitivDesc() {
    return addSortByInternal('infinitiv', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByInfinitivAccented() {
    return addSortByInternal('infinitivAccented', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByInfinitivAccentedDesc() {
    return addSortByInternal('infinitivAccented', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByAspect() {
    return addSortByInternal('aspect', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> sortByAspectDesc() {
    return addSortByInternal('aspect', Sort.desc);
  }
}

extension VerbQueryWhereSortThenBy on QueryBuilder<Verb, Verb, QSortThenBy> {
  QueryBuilder<Verb, Verb, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByInfinitiv() {
    return addSortByInternal('infinitiv', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByInfinitivDesc() {
    return addSortByInternal('infinitiv', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByInfinitivAccented() {
    return addSortByInternal('infinitivAccented', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByInfinitivAccentedDesc() {
    return addSortByInternal('infinitivAccented', Sort.desc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByAspect() {
    return addSortByInternal('aspect', Sort.asc);
  }

  QueryBuilder<Verb, Verb, QAfterSortBy> thenByAspectDesc() {
    return addSortByInternal('aspect', Sort.desc);
  }
}

extension VerbQueryWhereDistinct on QueryBuilder<Verb, Verb, QDistinct> {
  QueryBuilder<Verb, Verb, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Verb, Verb, QDistinct> distinctByInfinitiv(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('infinitiv', caseSensitive: caseSensitive);
  }

  QueryBuilder<Verb, Verb, QDistinct> distinctByInfinitivAccented(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('infinitivAccented',
        caseSensitive: caseSensitive);
  }

  QueryBuilder<Verb, Verb, QDistinct> distinctByAspect() {
    return addDistinctByInternal('aspect');
  }
}

extension VerbQueryProperty on QueryBuilder<Verb, Verb, QQueryProperty> {
  QueryBuilder<Verb, int?, QQueryOperations> idProperty() {
    return addPropertyName('id');
  }

  QueryBuilder<Verb, String, QQueryOperations> infinitivProperty() {
    return addPropertyName('infinitiv');
  }

  QueryBuilder<Verb, String, QQueryOperations> infinitivAccentedProperty() {
    return addPropertyName('infinitivAccented');
  }

  QueryBuilder<Verb, Aspect, QQueryOperations> aspectProperty() {
    return addPropertyName('aspect');
  }

  QueryBuilder<Verb, List<String>, QQueryOperations> imperativeProperty() {
    return addPropertyName('imperative');
  }

  QueryBuilder<Verb, List<String>, QQueryOperations> pastProperty() {
    return addPropertyName('past');
  }

  QueryBuilder<Verb, List<String>, QQueryOperations> presentFutureProperty() {
    return addPropertyName('presentFuture');
  }
}
