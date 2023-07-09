import 'package:monasba/network/helper/api.dart';

class SignUpService {
  Future<void> signUp({
    required bool isSignUp,
    required String firstName,
    required String lastName,
    required String userName,
    required String email,
    required String password,
    required String country,
    required String city,
    required String phoneNumber,
  }) async {
    await Api().post(isSignUp: isSignUp,isContentJson: true, restOfUrl: 'signup', body: {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'email': email,
      'password': password,
      'country': country,
      'city': city,
      'phoneNumber': phoneNumber,
    });
  }
}
