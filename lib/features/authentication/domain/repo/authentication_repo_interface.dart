import '../models/login_response.dart';
import '../models/register_response.dart';

abstract class AuthenticationRepoInterface{
  Future<LoginRequestResponse> login(String email, String password);
  Future<RegisterRequestResponse> register(String email, String password);
}