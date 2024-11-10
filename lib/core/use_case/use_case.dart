import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, param> {
  Future<Either<Failures, Type>> call(param param);
}
