import 'package:json_annotation/json_annotation.dart';

part 'create_request_dto.g.dart';

/// Request DTO for creating a new dealership
@JsonSerializable(createFactory: false, createToJson: true)
class DealershipCreateRequestDTO {
  final String name;
  final String address;
  final double latitude;
  final double longitude;

  const DealershipCreateRequestDTO({
    required this.name,
    required this.address,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() => _$DealershipCreateRequestDTOToJson(this);
}
