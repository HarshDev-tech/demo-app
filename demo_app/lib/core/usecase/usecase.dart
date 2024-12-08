import 'package:dartz/dartz.dart';
import 'package:demo_app/core/error/failure.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';



@module
abstract class UseCase<Type, Params> {

  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
