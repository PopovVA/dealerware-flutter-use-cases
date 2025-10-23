import 'package:json_annotation/json_annotation.dart';

part 'post_response_dto.g.dart';

/// Response DTO for a post
@JsonSerializable(createToJson: false, createFactory: true)
class PostResponseDTO {
  final String id;
  final String? title;
  final String? body;

  const PostResponseDTO({required this.id, this.title, this.body});

  factory PostResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$PostResponseDTOFromJson(json);
}
