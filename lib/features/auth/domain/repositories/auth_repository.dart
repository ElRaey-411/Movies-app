import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/errors/failure.dart';
import 'package:movies_app/features/auth/data/models/login_request.dart';
import 'package:movies_app/features/auth/data/models/register_request.dart';
import 'package:movies_app/features/auth/domain/entities/user_entity.dart';

import '../../data/models/Reset_password_request.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> register(RegisterRequest request);
  Future<Either<Failure, String>> login(LoginRequest request);
  Future<Either<Failure, void>> resetPassword(ResetPasswordRequest request);
}
