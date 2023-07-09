import 'package:monasba/network/helper/api.dart';

class VerifyPasswordService {
  Future<void> verifyPassword({required String resetCode}) async {
    await Api().post(
      isSignUp: false,
      isContentJson: true,
      restOfUrl: 'auth/verifyResetCode',
      body: {
        'resetCode': resetCode,
      },
    );
  }
}
