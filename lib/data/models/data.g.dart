// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetDataCollection on Isar {
  IsarCollection<Data> get datas => getCollection();
}

const DataSchema = CollectionSchema(
  name: 'Data',
  schema:
      '{"name":"Data","idName":"id","properties":[{"name":"createdAt","type":"Long"},{"name":"desc","type":"String"},{"name":"link","type":"String"}],"indexes":[],"links":[{"name":"tags","target":"Tag"}]}',
  idName: 'id',
  propertyIds: {'createdAt': 0, 'desc': 1, 'link': 2},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {'tags': 0},
  backlinkLinkNames: {},
  getId: _dataGetId,
  setId: _dataSetId,
  getLinks: _dataGetLinks,
  attachLinks: _dataAttachLinks,
  serializeNative: _dataSerializeNative,
  deserializeNative: _dataDeserializeNative,
  deserializePropNative: _dataDeserializePropNative,
  serializeWeb: _dataSerializeWeb,
  deserializeWeb: _dataDeserializeWeb,
  deserializePropWeb: _dataDeserializePropWeb,
  version: 3,
);

int? _dataGetId(Data object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _dataSetId(Data object, int id) {
  object.id = id;
}

List<IsarLinkBase> _dataGetLinks(Data object) {
  return [object.tags];
}

void _dataSerializeNative(IsarCollection<Data> collection, IsarRawObject rawObj,
    Data object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.createdAt;
  final _createdAt = value0;
  final value1 = object.description;
  IsarUint8List? _desc;
  if (value1 != null) {
    _desc = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_desc?.length ?? 0) as int;
  final value2 = object.link;
  IsarUint8List? _link;
  if (value2 != null) {
    _link = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_link?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeDateTime(offsets[0], _createdAt);
  writer.writeBytes(offsets[1], _desc);
  writer.writeBytes(offsets[2], _link);
}

Data _dataDeserializeNative(IsarCollection<Data> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Data();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.description = reader.readStringOrNull(offsets[1]);
  object.id = id;
  object.link = reader.readStringOrNull(offsets[2]);
  _dataAttachLinks(collection, id, object);
  return object;
}

P _dataDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _dataSerializeWeb(IsarCollection<Data> collection, Data object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(
      jsObj, 'createdAt', object.createdAt.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'desc', object.description);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'link', object.link);
  return jsObj;
}

Data _dataDeserializeWeb(IsarCollection<Data> collection, dynamic jsObj) {
  final object = Data();
  object.createdAt = IsarNative.jsObjectGet(jsObj, 'createdAt') != null
      ? DateTime.fromMillisecondsSinceEpoch(
              IsarNative.jsObjectGet(jsObj, 'createdAt'),
              isUtc: true)
          .toLocal()
      : DateTime.fromMillisecondsSinceEpoch(0);
  object.description = IsarNative.jsObjectGet(jsObj, 'desc');
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.link = IsarNative.jsObjectGet(jsObj, 'link');
  _dataAttachLinks(collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _dataDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'createdAt':
      return (IsarNative.jsObjectGet(jsObj, 'createdAt') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'createdAt'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'desc':
      return (IsarNative.jsObjectGet(jsObj, 'desc')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'link':
      return (IsarNative.jsObjectGet(jsObj, 'link')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _dataAttachLinks(IsarCollection col, int id, Data object) {
  object.tags.attach(col, col.isar.tags, 'tags', id);
}

extension DataQueryWhereSort on QueryBuilder<Data, Data, QWhere> {
  QueryBuilder<Data, Data, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension DataQueryWhere on QueryBuilder<Data, Data, QWhereClause> {
  QueryBuilder<Data, Data, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Data, Data, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Data, Data, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Data, Data, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Data, Data, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension DataQueryFilter on QueryBuilder<Data, Data, QFilterCondition> {
  QueryBuilder<Data, Data, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'createdAt',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'createdAt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'desc',
      value: null,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'desc',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'desc',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> descriptionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'desc',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'link',
      value: null,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'link',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'link',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Data, Data, QAfterFilterCondition> linkMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'link',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension DataQueryLinks on QueryBuilder<Data, Data, QFilterCondition> {
  QueryBuilder<Data, Data, QAfterFilterCondition> tags(FilterQuery<Tag> q) {
    return linkInternal(
      isar.tags,
      q,
      'tags',
    );
  }
}

extension DataQueryWhereSortBy on QueryBuilder<Data, Data, QSortBy> {
  QueryBuilder<Data, Data, QAfterSortBy> sortByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByDescription() {
    return addSortByInternal('desc', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByDescriptionDesc() {
    return addSortByInternal('desc', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByLink() {
    return addSortByInternal('link', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> sortByLinkDesc() {
    return addSortByInternal('link', Sort.desc);
  }
}

extension DataQueryWhereSortThenBy on QueryBuilder<Data, Data, QSortThenBy> {
  QueryBuilder<Data, Data, QAfterSortBy> thenByCreatedAt() {
    return addSortByInternal('createdAt', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByCreatedAtDesc() {
    return addSortByInternal('createdAt', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByDescription() {
    return addSortByInternal('desc', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByDescriptionDesc() {
    return addSortByInternal('desc', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByLink() {
    return addSortByInternal('link', Sort.asc);
  }

  QueryBuilder<Data, Data, QAfterSortBy> thenByLinkDesc() {
    return addSortByInternal('link', Sort.desc);
  }
}

extension DataQueryWhereDistinct on QueryBuilder<Data, Data, QDistinct> {
  QueryBuilder<Data, Data, QDistinct> distinctByCreatedAt() {
    return addDistinctByInternal('createdAt');
  }

  QueryBuilder<Data, Data, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('desc', caseSensitive: caseSensitive);
  }

  QueryBuilder<Data, Data, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Data, Data, QDistinct> distinctByLink(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('link', caseSensitive: caseSensitive);
  }
}

extension DataQueryProperty on QueryBuilder<Data, Data, QQueryProperty> {
  QueryBuilder<Data, DateTime, QQueryOperations> createdAtProperty() {
    return addPropertyNameInternal('createdAt');
  }

  QueryBuilder<Data, String?, QQueryOperations> descriptionProperty() {
    return addPropertyNameInternal('desc');
  }

  QueryBuilder<Data, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Data, String?, QQueryOperations> linkProperty() {
    return addPropertyNameInternal('link');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetTagCollection on Isar {
  IsarCollection<Tag> get tags => getCollection();
}

const TagSchema = CollectionSchema(
  name: 'Tag',
  schema:
      '{"name":"Tag","idName":"id","properties":[{"name":"tag","type":"String"}],"indexes":[{"name":"tag","unique":false,"properties":[{"name":"tag","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {'tag': 0},
  listProperties: {},
  indexIds: {'tag': 0},
  indexValueTypes: {
    'tag': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'datas': 0},
  backlinkLinkNames: {'datas': 'tags'},
  getId: _tagGetId,
  setId: _tagSetId,
  getLinks: _tagGetLinks,
  attachLinks: _tagAttachLinks,
  serializeNative: _tagSerializeNative,
  deserializeNative: _tagDeserializeNative,
  deserializePropNative: _tagDeserializePropNative,
  serializeWeb: _tagSerializeWeb,
  deserializeWeb: _tagDeserializeWeb,
  deserializePropWeb: _tagDeserializePropWeb,
  version: 3,
);

int? _tagGetId(Tag object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _tagSetId(Tag object, int id) {
  object.id = id;
}

List<IsarLinkBase> _tagGetLinks(Tag object) {
  return [object.datas];
}

void _tagSerializeNative(IsarCollection<Tag> collection, IsarRawObject rawObj,
    Tag object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.tag;
  final _tag = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_tag.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _tag);
}

Tag _tagDeserializeNative(IsarCollection<Tag> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Tag();
  object.id = id;
  object.tag = reader.readString(offsets[0]);
  _tagAttachLinks(collection, id, object);
  return object;
}

P _tagDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _tagSerializeWeb(IsarCollection<Tag> collection, Tag object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'tag', object.tag);
  return jsObj;
}

Tag _tagDeserializeWeb(IsarCollection<Tag> collection, dynamic jsObj) {
  final object = Tag();
  object.id = IsarNative.jsObjectGet(jsObj, 'id');
  object.tag = IsarNative.jsObjectGet(jsObj, 'tag') ?? '';
  _tagAttachLinks(collection, IsarNative.jsObjectGet(jsObj, 'id'), object);
  return object;
}

P _tagDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'tag':
      return (IsarNative.jsObjectGet(jsObj, 'tag') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _tagAttachLinks(IsarCollection col, int id, Tag object) {
  object.datas.attach(col, col.isar.datas, 'datas', id);
}

extension TagQueryWhereSort on QueryBuilder<Tag, Tag, QWhere> {
  QueryBuilder<Tag, Tag, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Tag, Tag, QAfterWhere> anyTag() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'tag'));
  }
}

extension TagQueryWhere on QueryBuilder<Tag, Tag, QWhereClause> {
  QueryBuilder<Tag, Tag, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> tagEqualTo(String tag) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'tag',
      value: [tag],
    ));
  }

  QueryBuilder<Tag, Tag, QAfterWhereClause> tagNotEqualTo(String tag) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tag',
        upper: [tag],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tag',
        lower: [tag],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'tag',
        lower: [tag],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'tag',
        upper: [tag],
        includeUpper: false,
      ));
    }
  }
}

extension TagQueryFilter on QueryBuilder<Tag, Tag, QFilterCondition> {
  QueryBuilder<Tag, Tag, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tag',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'tag',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Tag, Tag, QAfterFilterCondition> tagMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'tag',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension TagQueryLinks on QueryBuilder<Tag, Tag, QFilterCondition> {
  QueryBuilder<Tag, Tag, QAfterFilterCondition> datas(FilterQuery<Data> q) {
    return linkInternal(
      isar.datas,
      q,
      'datas',
    );
  }
}

extension TagQueryWhereSortBy on QueryBuilder<Tag, Tag, QSortBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTag() {
    return addSortByInternal('tag', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> sortByTagDesc() {
    return addSortByInternal('tag', Sort.desc);
  }
}

extension TagQueryWhereSortThenBy on QueryBuilder<Tag, Tag, QSortThenBy> {
  QueryBuilder<Tag, Tag, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTag() {
    return addSortByInternal('tag', Sort.asc);
  }

  QueryBuilder<Tag, Tag, QAfterSortBy> thenByTagDesc() {
    return addSortByInternal('tag', Sort.desc);
  }
}

extension TagQueryWhereDistinct on QueryBuilder<Tag, Tag, QDistinct> {
  QueryBuilder<Tag, Tag, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Tag, Tag, QDistinct> distinctByTag({bool caseSensitive = true}) {
    return addDistinctByInternal('tag', caseSensitive: caseSensitive);
  }
}

extension TagQueryProperty on QueryBuilder<Tag, Tag, QQueryProperty> {
  QueryBuilder<Tag, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Tag, String, QQueryOperations> tagProperty() {
    return addPropertyNameInternal('tag');
  }
}
