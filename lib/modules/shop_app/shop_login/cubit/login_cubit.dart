import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/shop_app/shop_login_model.dart';
import 'package:flutter_app/modules/shop_app/shop_login/cubit/shop_login_states.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/network/remote/dio_helper.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  bool isPassword = true;
  IconData suffixIcon = Icons.visibility_outlined;

  ShopLoginModel loginModel;

  void changeSuffixState() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ShopLoginChangeSuffixState());
  }

  int statusCode;

  static ShopLoginCubit get(context) => BlocProvider.of(context);

  void userLogin(String email, String password) {
    emit(ShopLoginLoadingState());
    DioHelper.post(
        path: LOGIN_ZUMRA,
        data: {'username': '$email', 'password': '$password'}).then((value) {
      // print(value.data);

      loginModel = ShopLoginModel.fromJson(value.data);
      // CacheHelper.setData('token', loginModel.token);
      statusCode = value.statusCode;

      emit(ShopLoginSuccessState(loginModel, value.statusCode));
    }).catchError((error) {
      print(statusCode);
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }

  //facebook configuration
  Map<String, dynamic> userObjFacebook = {};
  AccessToken facebookAccessToken;
  ShopLoginModel facebookLoginModel;

  facebookLogin(context) async {
    await FacebookAuth.instance.login(permissions: [
      'public_profile',
      'email',
    ]).then((value) {
      if (value.status == LoginStatus.success) {
        emit(ShopLoginLoadingState());
        facebookAccessToken = value.accessToken;
        print('Login with facebook is successful');
        print(value.accessToken.token);
        // token = value.accessToken.token;
        FacebookAuth.instance.getUserData().then((userData) {
          isLoggedWithFacebook = true;
          userObjFacebook = userData;

          print(userData.toString());
          print(facebookAccessToken.token);

          DioHelper.post(
              path: FACEBOOK_AUTH_ZUMRA,
              data: {'token': '${facebookAccessToken.token}'}).then((value) {
                print(value.data.toString());



                loginModel = ShopLoginModel.fromJson(value.data);
            loginModel.user.firstName = userObjFacebook['name'];
            loginModel.user.lastName = userObjFacebook['name'];
            loginModel.user.email = userObjFacebook['email'];
            loginModel.user.image = userObjFacebook['url'];

            // CacheHelper.setData('token', loginModel.token);
            statusCode = value.statusCode;
            print(loginModel.user.lastName);
            print(userObjFacebook['name']);

            emit(ShopLoginSuccessState(loginModel, value.statusCode));
          }).catchError((error){
            print(error);
            emit(ShopFacebookLoginFailedState());
          });
        }).catchError((error){
          print(error);
          emit(ShopFacebookLoginFailedState());
        });
      }
    });
  }

  Future<bool> isUserIsLoggedWithFacebook() async {
    facebookAccessToken = await FacebookAuth.instance.accessToken;
// or FacebookAuth.i.accessToken
    if (facebookAccessToken != null) {
      print('user is logged in');
      return true;
    } else {
      print('user is not logged in');
      return false;
    }
  }

  logOutFromFacebook() async {
    await FacebookAuth.instance.logOut();
  }


  //google configuration
  GoogleSignInAccount userObjGoogle ;
  GoogleSignIn googleSignIn;
  // AccessToken googleAccessToken;
  ShopLoginModel googleLoginModel;
  googleLogin()async{
    emit(ShopLoginLoadingState());
    googleSignIn = GoogleSignIn();
    googleSignIn.signIn().then((userData) {
      isLoggedWithGoogle = true;
      userObjGoogle = userData;
      userData.authentication.then((value) {
        print(userData.toString());
        // value.accessToken.characters;
        print(value.idToken);

        DioHelper.post(
            path: GOOGLE_AUTH_ZUMRA,
            data: {'token': '${value.idToken}'}).then((value) {
          print(value.data.toString());
          loginModel = ShopLoginModel.fromJson(value.data);
          loginModel.user.firstName = userObjGoogle.displayName;
          loginModel.user.lastName = userObjGoogle.displayName;
          loginModel.user.email = userObjGoogle.email;
          loginModel.user.image = userObjGoogle.photoUrl;


          CacheHelper.setData('token', loginModel.token);
          statusCode = value.statusCode;
          print(loginModel.user.lastName);
          print(userObjFacebook['name']);
          print(loginModel.token);

          emit(ShopLoginSuccessState(loginModel, value.statusCode));
        });
      });
    }
    ).catchError((error){
      print('failed to login with google');
      print('$error alo alo');
      emit(ShopGoogleLoginFailedState());
    });
  }


   recoverPassword(String email) async{
    await DioHelper.post(
      path: RECOVER_PASSWORD_ZUMRA,
      token: token,
      data: {
        'email':'$email',
      },
    ).then((value) {
      printFullText(value.statusMessage);
      emit(ShopPasswordRecoveryLoginSuccessState());
    }).catchError((error){
      // print(token.toString());
      // print(userData.id.toString());
      print(error.toString());
      emit(ShopPasswordRecoveryLoginFailureState(error.toString()));
    });
  }
}
