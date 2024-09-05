import "package:fpdart/fpdart.dart";
import "package:khanakhazana/global/error/error_message.dart";

abstract interface class Usecase<SuccessType, Params> {
  Future<Either<ErrorMessage, SuccessType>> call(Params params);
}
