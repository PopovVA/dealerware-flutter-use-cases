import 'package:dealerware_flutter_use_cases/features/posts/data/dto/dto.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';

/// Mock implementation of Posts repository with 20 items
class MockPostsRepository implements IPostsRepository {
  late List<PostResponseDTO> _posts;

  MockPostsRepository() {
    _posts = _createMockPosts();
  }

  static List<PostResponseDTO> _createMockPosts() {
    return [
      const PostResponseDTO(id: '1', title: 'Post 1', body: 'Body of post 1'),
      const PostResponseDTO(id: '2', title: 'Post 2', body: 'Body of post 2'),
      const PostResponseDTO(id: '3', title: 'Post 3', body: 'Body of post 3'),
      const PostResponseDTO(id: '4', title: 'Post 4', body: 'Body of post 4'),
      const PostResponseDTO(id: '5', title: 'Post 5', body: 'Body of post 5'),
      const PostResponseDTO(id: '6', title: 'Post 6', body: 'Body of post 6'),
      const PostResponseDTO(id: '7', title: 'Post 7', body: 'Body of post 7'),
      const PostResponseDTO(id: '8', title: 'Post 8', body: 'Body of post 8'),
      const PostResponseDTO(id: '9', title: 'Post 9', body: 'Body of post 9'),
      const PostResponseDTO(id: '10', title: 'Post 10', body: 'Body of post 10'),
      const PostResponseDTO(id: '11', title: 'Post 11', body: 'Body of post 11'),
      const PostResponseDTO(id: '12', title: 'Post 12', body: 'Body of post 12'),
      const PostResponseDTO(id: '13', title: 'Post 13', body: 'Body of post 13'),
      const PostResponseDTO(id: '14', title: 'Post 14', body: 'Body of post 14'),
      const PostResponseDTO(id: '15', title: 'Post 15', body: 'Body of post 15'),
      const PostResponseDTO(id: '16', title: 'Post 16', body: 'Body of post 16'),
      const PostResponseDTO(id: '17', title: 'Post 17', body: 'Body of post 17'),
      const PostResponseDTO(id: '18', title: 'Post 18', body: 'Body of post 18'),
      const PostResponseDTO(id: '19', title: 'Post 19', body: 'Body of post 19'),
      const PostResponseDTO(id: '20', title: 'Post 20', body: 'Body of post 20'),
    ];
  }

  @override
  Future<PostsDTO> getAll({int page = 1, int limit = 10}) async {
    final start = (page - 1) * limit;
    final end = (start + limit).clamp(0, _posts.length);
    if (start >= _posts.length) return [];
    return _posts.sublist(start, end);
  }

  @override
  Future<PostResponseDTO> getOne(String id) async {
    final index = _posts.indexWhere((p) => p.id == id);
    if (index < 0) throw Exception('Post not found: $id');
    return _posts[index];
  }

  @override
  Future<PostResponseDTO> create(PostCreateRequestDTO newPost) async {
    final id = (_posts.map((p) => int.tryParse(p.id) ?? 0).fold<int>(0, (a, b) => a > b ? a : b) + 1).toString();
    final created = PostResponseDTO(
      id: id,
      title: newPost.title,
      body: newPost.body,
    );
    _posts.add(created);
    return created;
  }

  @override
  Future<PostResponseDTO> update(PostUpdateRequestDTO updatedPost) async {
    final index = _posts.indexWhere((p) => p.id == updatedPost.id);
    if (index < 0) throw Exception('Post not found: ${updatedPost.id}');
    final existing = _posts[index];
    final updated = PostResponseDTO(
      id: existing.id,
      title: updatedPost.title ?? existing.title,
      body: updatedPost.body ?? existing.body,
    );
    _posts[index] = updated;
    return updated;
  }

  @override
  Future<void> delete(String id) async {
    _posts.removeWhere((p) => p.id == id);
  }
}
