import 'package:flutter_app/models/shop_app/shop_login_model.dart';

abstract class ShopRegisterStates{}

class ShopRegisterInitialState extends ShopRegisterStates{}
class ShopRegisterSuccessState extends ShopRegisterStates{
  final ShopLoginModel loginModel;
  final int statusCode;

  ShopRegisterSuccessState(this.loginModel, this.statusCode);
}
class ShopRegisterErrorState extends ShopRegisterStates{
  final String error;
  ShopRegisterErrorState(this.error);
}

class ShopRegisterChangeSuffixState extends ShopRegisterStates{}

class ShopRegisterLoadingState extends ShopRegisterStates{}