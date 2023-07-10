import 'package:monasba/network/helper/api.dart';

class ResetPasswordService {
  resetPassword(
      {required String newPassword, required String confirmPassword, required String token}) async {
    await Api().post(
      isSignUp: false,
      isContentJson: true,
      restOfUrl: 'auth/resetPassword',
      body: {
        'password': newPassword,
    'passwordConfirm': confirmPassword,
      },
      token: token,
    );
  }
}
