import 'package:dealerware_flutter_use_cases/features/posts/data/dto/dto.dart';
import 'package:equatable/equatable.dart';

/// Domain entity for Post - UI-friendly representation
class PostEntity extends Equatable {
  final String id;
  final String title;
  final String body;

  const PostEntity({required this.id, required this.title, required this.body});

  /// Create entity from DTO
  factory PostEntity.fromDTO(PostResponseDTO dto) {
    return PostEntity(
      id: dto.id,
      title: dto.title ?? 'Untitled',
      body: dto.body ?? '',
    );
  }

  /// Get preview of the body (first N characters)
  String getBodyPreview({int maxLength = 100}) {
    if (body.length <= maxLength) {
      return body;
    }
    return '${body.substring(0, maxLength)}...';
  }

  /// Check if post has content
  bool get hasContent => title.isNotEmpty || body.isNotEmpty;

  /// Get word count
  int get wordCount {
    if (body.isEmpty) return 0;
    return body.split(RegExp(r'\s+')).where((word) => word.isNotEmpty).length;
  }

  /// Copy with method for immutability
  PostEntity copyWith({String? id, String? title, String? body}) {
    return PostEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  @override
  List<Object?> get props => [id, title, body];

  @override
  bool get stringify => true;
}
