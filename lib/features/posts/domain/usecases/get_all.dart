import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';

/// Parameters for getting posts with pagination
class GetPostsParams extends IUseCaseParams {
  final int page;
  final int limit;

  const GetPostsParams({this.page = 1, this.limit = 10});

  @override
  List<Object?> get props => [page, limit];
}

/// Use case for getting list of posts
class GetPosts implements IUseCase<List<PostEntity>, GetPostsParams> {
  final IPostsRepository repository;

  const GetPosts(this.repository);

  @override
  Future<List<PostEntity>> call(GetPostsParams params) async {
    try {
      final dto = await repository.getAll(
        page: params.page,
        limit: params.limit,
      );
      return dto.map(PostEntity.fromDTO).toList();
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      throw e.toPostException();
    } catch (e) {
      // Unexpected error
      throw PostNetworkException(e);
    }
  }
}
