import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';

/// Parameters for getting a single post
class GetOneByIdPostParams extends IUseCaseParams {
  final String id;

  const GetOneByIdPostParams(this.id);

  @override
  List<Object?> get props => [id];
}

/// Use case for getting a single post by ID
class GetOneByIdPost implements IUseCase<PostEntity, GetOneByIdPostParams> {
  final IPostsRepository repository;

  const GetOneByIdPost(this.repository);

  @override
  Future<PostEntity> call(GetOneByIdPostParams params) async {
    try {
      final dto = await repository.getOne(params.id);
      return PostEntity.fromDTO(dto);
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
