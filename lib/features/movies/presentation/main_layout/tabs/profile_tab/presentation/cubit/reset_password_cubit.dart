import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies_app/features/auth/data/models/Reset_password_request.dart';
import '../../../../../../../auth/domain/use_cases/reset_password_use_case.dart';

@lazySingleton
class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final  ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordCubit({required this.resetPasswordUseCase}) : super(ResetPasswordInitial());

  void resetPassword(ResetPasswordRequest request) async {
    emit(ResetPasswordLoading());
    final result = await resetPasswordUseCase(request);
    result.fold(
      (failure) {
        emit(ResetPasswordError(message: failure.message));
        },
      (_) {
        emit(ResetPasswordSuccess());
      },
    );
  }


}

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  final String message;
  ResetPasswordError({required this.message});
}

class ResetPasswordSuccess extends ResetPasswordState {

}
