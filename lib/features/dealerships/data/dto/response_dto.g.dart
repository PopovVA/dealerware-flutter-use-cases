// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealershipResponseDTO _$DealershipResponseDTOFromJson(
  Map<String, dynamic> json,
) => DealershipResponseDTO(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  createdAt: DateTime.parse(json['createdAt'] as String),
);
