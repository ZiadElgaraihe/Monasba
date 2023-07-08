import 'package:monasba/network/helper/api.dart';
import 'package:monasba/network/models/reset_password_model.dart';

class ForgetPasswordService {
  Future<ResetPasswordModel> forgetPassword({required bool isSignUp,required String email}) async {
    Map<String, dynamic> data = await Api().post(
      isSignUp: isSignUp,
      restOfUrl: 'forgotPassword',
      body: {
        'flag': 'email',
        'email': email,
      },
    );
    return ResetPasswordModel.fromJson(data: data);
  }
}
