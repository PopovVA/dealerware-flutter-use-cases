import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';

/// Parameters for deleting a post
class DeleteOneByIdPostParams extends IUseCaseParams {
  final String id;

  const DeleteOneByIdPostParams(this.id);

  @override
  List<Object?> get props => [id];
}

/// Use case for deleting a post
class DeleteOneByIdPost implements IUseCase<void, DeleteOneByIdPostParams> {
  final IPostsRepository repository;

  const DeleteOneByIdPost(this.repository);

  @override
  Future<void> call(DeleteOneByIdPostParams params) async {
    try {
      return await repository.delete(params.id);
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      // Pass the ID for better error messages
      throw e.toPostException(params.id);
    } catch (e) {
      // Unexpected error
      throw PostNetworkException(e);
    }
  }
}
