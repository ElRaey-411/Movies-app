import 'package:movies_app/features/auth/data/models/Reset_password_request.dart';
import 'package:movies_app/features/auth/data/models/login_request.dart';
import 'package:movies_app/features/auth/data/models/login_response.dart';
import 'package:movies_app/features/auth/data/models/register_request.dart';
import 'package:movies_app/features/auth/data/models/register_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);
  Future<LoginResponse> login(LoginRequest request);
  Future<void> resetPassword(ResetPasswordRequest request,String token);
}
