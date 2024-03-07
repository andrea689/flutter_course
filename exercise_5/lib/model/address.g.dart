// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      streetAddress: json['street_address'] as String,
      streetName: json['street_name'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) =>
    <String, dynamic>{
      'street_address': instance.streetAddress,
      'street_name': instance.streetName,
      'city': instance.city,
    };
