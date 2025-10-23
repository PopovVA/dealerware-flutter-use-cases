import 'package:json_annotation/json_annotation.dart';

part 'update_request_dto.g.dart';

/// Request DTO for updating a dealership
@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class DealershipUpdateRequestDTO {
  final String id;
  final String? name;
  final String? address;
  final double? latitude;
  final double? longitude;

  const DealershipUpdateRequestDTO({
    required this.id,
    this.name,
    this.address,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toJson() => _$DealershipUpdateRequestDTOToJson(this);
}
