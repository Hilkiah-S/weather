import 'package:dartz/dartz.dart';
import 'package:practice/config/util/error/failure.dart';

typedef FutureResult<T> = Future<Either<Failure, T>>;
