import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/dto/request/params_to_dto_extensions.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';

/// Parameters for creating a new post
class CreatePostParams extends IUseCaseParams {
  final String title;
  final String body;

  const CreatePostParams({required this.title, required this.body});

  @override
  List<Object?> get props => [title, body];
}

/// Use case for creating a new post
class CreatePost implements IUseCase<PostEntity, CreatePostParams> {
  final IPostsRepository repository;

  const CreatePost(this.repository);

  @override
  Future<PostEntity> call(CreatePostParams params) async {
    try {
      final dto = await repository.create(params.toCreateRequestDTO());
      return PostEntity.fromDTO(dto);
    } on ApiException catch (e) {
      // Map technical exceptions to domain exceptions
      throw e.toPostException();
    } catch (e) {
      // Unexpected error
      throw PostNetworkException(e);
    }
  }
}
