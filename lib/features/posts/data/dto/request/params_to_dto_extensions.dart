import 'package:dealerware_flutter_use_cases/features/posts/data/dto/request/create_post_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/posts/data/dto/request/update_post_request_dto.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/create.dart';
import 'package:dealerware_flutter_use_cases/features/posts/domain/usecases/update.dart';

/// Extension to convert CreatePostParams to Request DTO
extension CreateParamsToDTO on CreatePostParams {
  PostCreateRequestDTO toCreateRequestDTO() {
    return PostCreateRequestDTO(title: title, body: body);
  }
}

/// Extension to convert UpdatePostParams to Request DTO
extension UpdateParamsToDTO on UpdatePostParams {
  PostUpdateRequestDTO toUpdateRequestDTO() {
    return PostUpdateRequestDTO(id: id, title: title, body: body);
  }
}
