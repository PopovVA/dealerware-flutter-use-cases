// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dealership_DTO.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealershipDTO _$DealershipDTOFromJson(Map<String, dynamic> json) =>
    DealershipDTO(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$DealershipDTOToJson(DealershipDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'createdAt': instance.createdAt.toIso8601String(),
    };
