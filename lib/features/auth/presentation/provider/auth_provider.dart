import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  int selectedAvatar = 5;
  int currentValue = 0;
  bool visiblePassword = true;
  bool visibleConfirmPassword = true;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  void pickAvatarImage(int avatarIndex) {
    selectedAvatar = avatarIndex;
    notifyListeners();
  }

  void switcher(int index) {
    currentValue = index;
    notifyListeners();
  }

  void changeConfirmPasswordVisibilityState() {
    visibleConfirmPassword = !visibleConfirmPassword;
    notifyListeners();
  }

  void changePasswordVisibilityState() {
    visiblePassword = !visiblePassword;
    notifyListeners();
  }

  String? confirmPasswordValidator(String? input) {
    if (input == null || input.trim().isEmpty) {
      return "This field is required";
    } else if (input != passwordController.text) {
      return "Password does't match";
    } else {
      return null;
    }
  }

  void onCreateAccountClicked() {
    if (loginFormKey.currentState?.validate() == false) return;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    loginEmailController.dispose();
    loginPasswordController.dispose();
    super.dispose();
  }
}
