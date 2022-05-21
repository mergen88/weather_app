import 'package:dart_extensions_methods/dart_extension_methods.dart';
import 'package:flutter_application_cube/core/error/failure.dart';

abstract class UseCase<T, Params> {
  Future<Pair<Failure, T>> call(Params params);
}
