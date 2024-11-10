import 'package:clean_arch_bookly_app/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class OnParamUseCase <Type> 
{
  Future <Either<Failures,Type>> call();
}