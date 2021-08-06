import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/layout/shop_app/shop_layout.dart';
import 'package:flutter_app/modules/shop_app/register/shop_register_screen.dart';
import 'package:flutter_app/modules/shop_app/shop_login/cubit/shop_login_states.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'cubit/login_cubit.dart';

class ShopLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var resetPasswordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocConsumer<ShopLoginCubit, ShopLoginStates>(
      listener: (context, state) {
        if (state is ShopLoginSuccessState) {
          // print(state.loginModel.token);
          // print(state.loginModel.user);
          makeToast(
            message: 'Welcome to Zumra',
            toastColor: Colors.green,
            gravity: ToastGravity.BOTTOM,
          );
          CacheHelper.setData(
              'token',
              state.loginModel
                  .token); //hna ha5od el token awl ma ab2a successfully in
          token = state.loginModel.token;
          print(token);
          navigateToAndReplace(context, ShopLayout());
        } else if (state is ShopLoginErrorState) {
          makeToast(
            message: 'Email already in use',
            toastColor: Colors.red,
            gravity: ToastGravity.BOTTOM,
          );
        } else if (state is ShopFacebookLoginSuccessState) {
          // CacheHelper.setData('token', value)
        }
        // if(state is ShopLoginSuccessState){
        //   if(state.loginModel.status){
        //     print(state.loginModel.message);
        //     print(state.loginModel.data.token);
        //     makeToast(
        //       message:state.loginModel.message,
        //       toastColor: Colors.green,
        //       gravity: ToastGravity.BOTTOM,
        //     );
        //     CacheHelper.setData('token', state.loginModel.data.token); //hna ha5od el token awl ma ab2a successfully in
        //     navigateToAndReplace(context, ShopLayout());
        //
        //   }else{
        //     makeToast(
        //       message:state.loginModel.message,
        //       toastColor: Colors.red,
        //       gravity: ToastGravity.BOTTOM,
        //
        //     );
        //     print(state.loginModel.message);
        //     // print(state.loginModel.data.token);
        //   }
        // }
        if(state is ShopPasswordRecoveryLoginSuccessState) {
          makeToast(
            gravity: ToastGravity.BOTTOM,
            toastColor: Colors.green,
            message: 'Email sent successfully',
          );
        }else if (state is ShopPasswordRecoveryFailureState){
          makeToast(
            gravity: ToastGravity.BOTTOM,
            toastColor: Colors.red,
            message: 'Something went wrong, please try again',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      buildDefaultButton(() {
                        ShopLoginCubit.get(context).facebookLogin(context);
                      }, 'Login with FaceBook'),
                      SizedBox(
                        height: 10,
                      ),
                      buildDefaultButton(() {
                        ShopLoginCubit.get(context).googleLogin();
                      }, 'Login with google'),
                      SizedBox(
                        height: 10,
                      ),
                      buildDefaultTFF(
                          isPassword: false,
                          type: TextInputType.emailAddress,
                          controller: emailController,
                          prefix: Icons.mail_outline,
                          labelText: 'Email Address',
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please, Enter your email address';
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      buildDefaultTFF(
                          isPassword: ShopLoginCubit.get(context).isPassword,
                          controller: passwordController,
                          prefix: Icons.lock_outline,
                          labelText: 'Password',
                          suffix: ShopLoginCubit.get(context).suffixIcon,
                          obsPress: () {
                            ShopLoginCubit.get(context).changeSuffixState();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'Please, Enter your password';
                            }
                            return null;
                          }),
                      Row(
                        children: [
                          Spacer(),
                          TextButton(
                            onPressed: () {
                              showModalBottomSheetForgetPassword(context, resetPasswordController, state);
                            },
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Conditional.single(
                        context: context,
                        widgetBuilder: (context) {
                          return buildDefaultButton(() {
                            if (formKey.currentState.validate()) {
                              print('sssssssssssssss');
                              ShopLoginCubit.get(context).userLogin(
                                  emailController.text,
                                  passwordController.text);
                            }
                          }, 'LOGIN');
                        },
                        conditionBuilder: (context) {
                          return state is! ShopLoginLoadingState;
                        },
                        fallbackBuilder: (context) {
                          return Center(child: CircularProgressIndicator());
                        },
                      ), //da el login button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: TextButton(
                              child: Text('REGISTER',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.blue)),
                              onPressed: () {
                                navigateTo(context, ShopRegisterScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  showModalBottomSheetForgetPassword(
      context, TextEditingController controller, ShopLoginStates state) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Please enter your email',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  buildDefaultTFF(
                    isPassword: false,
                    controller: controller,
                    prefix: Icons.outgoing_mail,
                    labelText: 'Email',
                    type: TextInputType.emailAddress,
                    // validate: (String value) {
                    //   if (value.isEmpty) {
                    //     return 'Please, Enter your password';
                    //   }
                    //   return null;
                    // }
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  buildDefaultButton(
                    () {
                      Navigator.pop(context);
                      print(controller.text.toString());
                      if(controller.text.toString().isNotEmpty) {
                        ShopLoginCubit.get(context).recoverPassword(controller.text);
                        // Future.delayed(Duration(seconds: 2));

                      }else{
                        makeToast(
                          gravity: ToastGravity.BOTTOM,
                          toastColor: Colors.yellow,
                          message: 'The email can\'t be empty, please enter your email address',
                        );
                      }
                    },
                    'Confirm',
                    containerColor: Colors.red,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
