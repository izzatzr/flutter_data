// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family.dart';

// **************************************************************************
// DataGenerator
// **************************************************************************

// ignore_for_file: unused_local_variable
class _$FamilyRepository extends Repository<Family> {
  _$FamilyRepository(LocalAdapter<Family> adapter) : super(adapter);

  @override
  get relationshipMetadata => {
        'HasMany': {'persons': 'people'},
        'BelongsTo': {'house': 'houses'},
        'repository#people': manager.locator<Repository<Person>>(),
        'repository#houses': manager.locator<Repository<House>>()
      };

  @override
  setOwnerInRelationships(owner, model) {
    model.persons?.owner = owner;
    model.house?.owner = owner;
  }

  @override
  void setInverseInModel(inverse, model) {
    if (inverse is DataId<Person>) {
      model.persons?.inverse = inverse;
    }
    if (inverse is DataId<House>) {
      model.house?.inverse = inverse;
    }
  }
}

class $FamilyRepository extends _$FamilyRepository {
  $FamilyRepository(LocalAdapter<Family> adapter) : super(adapter);
}

// ignore: must_be_immutable, unused_local_variable
class $FamilyLocalAdapter extends LocalAdapter<Family> {
  $FamilyLocalAdapter(box, DataManager manager) : super(box, manager);

  @override
  deserialize(map, {key}) {
    map['persons'] = {
      '_': [map['persons'], manager]
    };
    map['house'] = {
      '_': [map['house'], manager]
    };

    manager.dataId<Family>(map.id, key: key);
    return Family.fromJson(map);
  }

  @override
  serialize(model) {
    final map = model.toJson();
    map['persons'] = model.persons?.keys;
    map['house'] = model.house?.key;
    return map;
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Family _$FamilyFromJson(Map<String, dynamic> json) {
  return Family(
    id: json['id'] as String,
    surname: json['surname'] as String,
    house: json['house'] == null
        ? null
        : BelongsTo.fromJson(json['house'] as Map<String, dynamic>),
    persons: json['persons'] == null
        ? null
        : HasMany.fromJson(json['persons'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$FamilyToJson(Family instance) => <String, dynamic>{
      'id': instance.id,
      'surname': instance.surname,
      'house': instance.house,
      'persons': instance.persons,
    };
