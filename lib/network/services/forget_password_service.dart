import 'package:monasba/network/helper/api.dart';
import 'package:monasba/network/models/reset_password_model.dart';

class ForgetPasswordService {
  Future<ResetPasswordModel> forgetPassword({required String email}) async {
    Map<String, dynamic> data = await Api().post(
      isSignUp: false,
      isContentJson: true,
      restOfUrl: 'auth/forgotPassword',
      body: {
        'flag': 'email',
        'email': email,
      },
    );
    return ResetPasswordModel.fromJson(data: data);
  }
}
