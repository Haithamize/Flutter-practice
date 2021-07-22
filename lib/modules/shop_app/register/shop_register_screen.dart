import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/shop_layout.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_picker/source/enums.dart';

import 'cubit/register_cubit.dart';
import 'cubit/shop_register_states.dart';

class ShopRegisterScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var genderController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (context, state) {
          if (state is ShopRegisterSuccessState) {
            print(state.loginModel.token);
            print(state.loginModel.user);
            CacheHelper.setData('token', state.loginModel.token);
            token = state.loginModel.token;
            makeToast(
              message: 'Account registered successfully, Welcome to Zumra',
              toastColor: Colors.green,
              gravity: ToastGravity.BOTTOM,
            );
            CacheHelper.setData(
                'token',
                state.loginModel
                    .token); //hna ha5od el token awl ma ab2a successfully in
            token = state.loginModel.token;
            navigateToAndReplace(context, ShopLayout());
          }else if(state is ShopRegisterErrorState){
            makeToast(
              message: 'Email already in use',
              toastColor: Colors.red,
              gravity: ToastGravity.BOTTOM,
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
                          'Register',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: buildDefaultTFF(
                                  isPassword: false,
                                  controller: firstNameController,
                                  type: TextInputType.name,
                                  prefix: Icons.drive_file_rename_outline,
                                  labelText: 'First name',
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please, Enter your first name';
                                    }
                                    return null;
                                  }),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: buildDefaultTFF(
                                  isPassword: false,
                                  controller: lastNameController,
                                  prefix: Icons.drive_file_rename_outline,
                                  labelText: 'Last name',
                                  validate: (String value) {
                                    if (value.isEmpty) {
                                      return 'Please, Enter your last name';
                                    }
                                    return null;
                                  }),
                            ),
                          ],
                        ),
                        SizedBox(height: 10,),
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
                            isPassword: false,
                            type: TextInputType.number,
                            controller: mobileController,
                            prefix: Icons.phone,
                            labelText: 'Phone',
                            // validate: (String value) {
                            //   if (value.isEmpty) {
                            //     return 'Please, Enter your email address';
                            //   }
                            //   return null;
                            // }
                            ),
                        SizedBox(height: 10,),
                        buildDefaultTFF(
                            isPassword:
                                ShopRegisterCubit.get(context).isPassword,
                            controller: passwordController,
                            prefix: Icons.lock_outline,
                            labelText: 'Password',
                            suffix: ShopRegisterCubit.get(context).suffixIcon,
                            obsPress: () {
                              ShopRegisterCubit.get(context)
                                  .changeSuffixState();
                            },
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please, Enter your password';
                              }
                              return null;
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        makeGender(genderController),
                        SizedBox(height: 20,),
                        Conditional.single(
                          context: context,
                          widgetBuilder: (context) {
                            return buildDefaultButton(() {
                              print(genderController.text);
                              if (formKey.currentState.validate()) {
                                ShopRegisterCubit.get(context).userRegister(
                                    emailController.text,
                                    passwordController.text,
                                    firstNameController.text,
                                    lastNameController.text,
                                    genderController.text,
                                    mobileController.text
                                );
                              }
                            }, 'REGISTER');
                          },
                          conditionBuilder: (context) {
                            return state is! ShopRegisterLoadingState;
                          },
                          fallbackBuilder: (context) {
                            return Center(child: CircularProgressIndicator());
                          },
                        ), //da el login button
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
