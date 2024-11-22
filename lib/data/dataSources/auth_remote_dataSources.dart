//! going to create an interface for the auth remote data source as well
//! so that whenever I have to change from supabase to any other database I have a strict contract to follow and I don't miss out on anything
//! so I'm going to create abstract interface class

import 'package:blog_app/core/config/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDatasources {
  Future<String> signUpWithEmailAndPassword(
      {required String name, required String email, required String password});

  Future<String> loginWithEmailAndPassword(
      {required String email, required String password});
}

//! Now I have my interface with me and now I'm going to create a general class that will implement this AuthRemoteDatasources

class AuthRemoteDatasourcesImpl implements AuthRemoteDatasources {
  final SupabaseClient supabaseClient;
  AuthRemoteDatasourcesImpl(this.supabaseClient);

//**Now, we can start implementing our methods using Supabase. You might wonder why we are taking the Supabase client from the constructor instead of initializing it directly within the class, like this: `SupabaseClient`. The reason is that initializing it directly creates a dependency between the `AuthRemoteDataSourceImplementation` and the Supabase client. If we ever need to change our database from Supabase to Firebase, it would involve significant changes.

//**To address this, we use **dependency injection**, meaning we inject the Supabase client instance into the class whenever it is called. This approach also simplifies unit testing because external dependencies can be mocked during testing. By injecting the Supabase client, we avoid creating a dependency and enable easier testing by mocking the Supabase client.

  @override
  Future<String> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (response.user == null) {
        throw const ServerException('User not found');
      }
      return response.user!.id;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
