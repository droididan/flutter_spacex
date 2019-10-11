import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:spacex_app/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {}
