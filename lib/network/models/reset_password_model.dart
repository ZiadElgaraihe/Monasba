class ResetPasswordModel {
  String token;

  ResetPasswordModel({required this.token});

  factory ResetPasswordModel.fromJson({required Map<String, dynamic> data}){
    return ResetPasswordModel(token: data['token']);
  }
}
