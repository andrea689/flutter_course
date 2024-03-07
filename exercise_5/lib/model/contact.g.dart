// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactImpl _$$ContactImplFromJson(Map<String, dynamic> json) =>
    _$ContactImpl(
      id: json['id'] as int,
      name: json['first_name'] as String,
      imageUrl: json['avatar'] as String,
      number: json['phone_number'] as String,
      address: Address.fromJson(json['address'] as Map<String, dynamic>),
      birthday: DateTime.parse(json['date_of_birth'] as String),
    );

Map<String, dynamic> _$$ContactImplToJson(_$ContactImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'first_name': instance.name,
      'avatar': instance.imageUrl,
      'phone_number': instance.number,
      'address': instance.address,
      'date_of_birth': instance.birthday.toIso8601String(),
    };
