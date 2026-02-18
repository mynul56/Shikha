import '../network/network_client.dart';
import '../models/user_model.dart';

class AuthRepository {
  final NetworkClient _networkClient = NetworkClient();

  Future<User> login(String email, String password) async {
    try {
      final response = await _networkClient.dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );
      return User.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }

  Future<User> signup(
    String name,
    String email,
    String password,
    String role,
  ) async {
    try {
      final response = await _networkClient.dio.post(
        '/auth/signup',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );
      return User.fromJson(response.data);
    } catch (e) {
      throw e;
    }
  }
}
