import 'package:flutter_app/models/shop_app/shop_login_model.dart';

abstract class ShopLoginStates{}

class ShopLoginInitialState extends ShopLoginStates{}
class ShopLoginLoadingState extends ShopLoginStates{}
class ShopLoginSuccessState extends ShopLoginStates{
  final ShopLoginModel loginModel;
  final int statusCode;

  ShopLoginSuccessState(this.loginModel, this.statusCode);
}
class ShopLoginErrorState extends ShopLoginStates{
  final String error;
  ShopLoginErrorState(this.error);
}

class ShopLoginChangeSuffixState extends ShopLoginStates{}


class ShopFacebookLoginSuccessState extends ShopLoginStates{}
class ShopFacebookLoginCancelledState extends ShopLoginStates{}
class ShopFacebookLoginFailedState extends ShopLoginStates{}


class ShopGoogleLoginSuccessState extends ShopLoginStates{}
class ShopGoogleLoginCancelledState extends ShopLoginStates{}
class ShopGoogleLoginFailedState extends ShopLoginStates{}

class ShopPasswordRecoveryLoginSuccessState extends ShopLoginStates{}
class ShopPasswordRecoveryLoginFailureState extends ShopLoginStates{
  final String error;

  ShopPasswordRecoveryLoginFailureState(this.error);
}