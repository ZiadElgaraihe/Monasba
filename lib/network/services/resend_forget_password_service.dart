import 'package:monasba/network/helper/api.dart';
import 'package:monasba/network/models/reset_password_model.dart';

class ResendForgetPasswordService {
  Future<ResetPasswordModel> resendForgetPassword({
    required String token,
  }) async {
    Map<String, dynamic> data = await Api().post(
      isSignUp: false,
      isContentJson: false,
      restOfUrl: 'resendForgetPassword',
      token: token,
    );
    return ResetPasswordModel.fromJson(data: data);
  }
}
