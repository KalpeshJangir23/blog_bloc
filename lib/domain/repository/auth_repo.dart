import 'package:blog_app/core/config/error/failure.dart';
import 'package:fpdart/fpdart.dart';

//! It enforces the structure without providing concrete implementations.
abstract interface class AuthRepo {
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password});
}
