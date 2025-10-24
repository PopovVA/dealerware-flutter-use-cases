import 'package:dealerware_flutter_use_cases/features/posts/data/dto/dto.dart';

typedef PostsDTO = List<PostResponseDTO>;

/// Repository interface for Posts
abstract interface class IPostsRepository {
  /// Get all posts with pagination
  Future<PostsDTO> getAll({int page = 1, int limit = 10});

  /// Get single post by ID
  Future<PostResponseDTO> getOne(String id);

  /// Create new post
  Future<PostResponseDTO> create(PostCreateRequestDTO newPost);

  /// Update existing post
  Future<PostResponseDTO> update(PostUpdateRequestDTO updatedPost);

  /// Delete post by ID
  Future<void> delete(String id);
}
