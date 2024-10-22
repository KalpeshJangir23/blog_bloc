import 'package:blog_app/core/config/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<Either<Failure, String>> signInWithEmailAndPassword(
      {required String email, required String password});
}
