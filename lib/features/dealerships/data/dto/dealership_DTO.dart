// ignore: file_names
import 'package:json_annotation/json_annotation.dart';

part 'dealership_dto.g.dart';

// {
//   "createdAt": "2025-10-22T09:13:01.889Z",
//   "name": "Boyer - Borer",
//   "address": "94603 Roberts Walk",
//   "latitude": -75.7185,
//   "longitude": 168.223,
//   "id": "1"
// }

@JsonSerializable()
class DealershipDTO {
  final String id;
  final String name;
  final String address;
  final double latitude;
  final double longitude;
  final DateTime createdAt;

  const DealershipDTO({
    required this.id,
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
  });

  factory DealershipDTO.fromJson(Map<String, dynamic> json) =>
      _$DealershipDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DealershipDTOToJson(this);
}
