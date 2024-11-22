import 'package:blog_app/core/config/error/failure.dart';
import 'package:blog_app/data/dataSources/auth_remote_dataSources.dart';
import 'package:blog_app/domain/repository/auth_repo.dart';
import 'package:fpdart/src/either.dart';

class AuthRepositoryImplementation implements AuthRepo {
  final AuthRemoteDatasources authRemoteDatasources;
  AuthRepositoryImplementation(
      this.authRemoteDatasources); // remote data source don't put all remote data source implementation over here because
  //**we don't want to depend on implementation we want to depend on the interface that we created

  @override
  Future<Either<Failure, String>> loginWithEmailAndPassword(
      {required String email, required String password}) {
    // TODO: implement loginWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmailAndPassword(
      {required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailAndPassword
    throw UnimplementedError();
  }
}
