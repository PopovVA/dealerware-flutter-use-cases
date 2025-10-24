import 'package:dealerware_flutter_use_cases/core/api/api_exceptions.dart';
import 'package:dealerware_flutter_use_cases/core/usecase/usecase.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/dto/request/params_to_dto_extensions.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/repository/posts_repository.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/entities/post_entity.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/exceptions/post_exceptions.dart';

/// Parameters for updating a post
class UpdatePostParams extends IUseCaseParams {
  final String id;
  final String? title;
  final String? body;

  const UpdatePostParams({required this.id, this.title, this.body});

  @override
  List<Object?> get props => [id, title, body];
}

/// Use case for updating a post
class UpdatePost implements IUseCase<PostEntity, UpdatePostParams> {
  final IPostsRepository repository;

  const UpdatePost(this.repository);

  @override
  Future<PostEntity> call(UpdatePostParams params) async {
    try {
      final dto = await repository.update(params.toUpdateRequestDTO());
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
