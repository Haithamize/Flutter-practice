import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/shop_app/shop_login_model.dart';
import 'package:flutter_app/modules/shop_app/register/cubit/shop_register_states.dart';
import 'package:flutter_app/modules/shop_app/shop_login/cubit/shop_login_states.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ShopRegisterCubit extends Cubit<ShopRegisterStates>{
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  ShopLoginModel loginModel;

  void changeSuffixState(){
    isPassword = !isPassword;
    suffixIcon = isPassword? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopRegisterChangeSuffixState());
  }

  int statusCode;

  static ShopRegisterCubit get(context) => BlocProvider.of(context);

  void userRegister(String email, String password, String firstName, String lastName, String gender,String mobile){
    emit(ShopRegisterLoadingState());
    DioHelper.post(path: REGISTER_ZUMRA, data: {
      'email':'$email',
      'password':'$password',
      'firstName':'$firstName',
      'lastName':'$lastName',
      'gender':'$gender',
      'mobile':'$mobile',
    }).then((value) {
      // print(value.data);

      loginModel = ShopLoginModel.fromJson(value.data);
      CacheHelper.setData('token', loginModel.token);
      statusCode = value.statusCode;

      emit(ShopRegisterSuccessState(loginModel, value.statusCode));
    }).catchError((error){
      print(statusCode);
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }
}