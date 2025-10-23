import 'package:json_annotation/json_annotation.dart';

part 'create_post_request_dto.g.dart';

/// Request DTO for creating a new post
@JsonSerializable(createFactory: false, createToJson: true)
class PostCreateRequestDTO {
  final String title;
  final String body;

  const PostCreateRequestDTO({required this.title, required this.body});

  Map<String, dynamic> toJson() => _$PostCreateRequestDTOToJson(this);
}
