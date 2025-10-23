import 'package:json_annotation/json_annotation.dart';

part 'update_post_request_dto.g.dart';

/// Request DTO for updating a post
@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class PostUpdateRequestDTO {
  final String id;
  final String? title;
  final String? body;

  const PostUpdateRequestDTO({required this.id, this.title, this.body});

  Map<String, dynamic> toJson() => _$PostUpdateRequestDTOToJson(this);
}
