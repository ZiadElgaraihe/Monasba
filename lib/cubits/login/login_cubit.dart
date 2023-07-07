import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monasba/network/remote/dio_helper.dart';
import 'package:monasba/network/remote/end_points.dart';
import '../../network/models/login_model.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static login_model? data;

 // static String? email="";
//  static String? password="";

  static LoginCubit get(context) => BlocProvider.of(context);

  userSignIn(email,password) async {
    emit(LoginLoading());

    try {
      Map<String, String?> json = {"email": email, "password": password};

      final response = await DioHelper.postData(url: LOGIN, data: json);
      data = login_model.fromJson(response.data);
      emit(LoginSuccess());
    } catch (error) {
      emit(
        LoginError(
          error.toString(),
        ),
      );
    }
  }

//            ****another solution has same result**** top is from tap cash app

  //  userSignIn() {
  //   String? email;
  //   String? password;
  //   DioHelper.postData(url: LOGIN, data: {
  //     'email': email,
  //     'password': password,
  //   }).then((value) {
  //     print(value.data);
  //     emit(LoginSuccess());
  //   }).catchError((error) {
  //     print('M7LOLA ISA');
  //     print(error.toString());

  //     emit(LoginError(error.toString()));
  //   });
  // }
}
