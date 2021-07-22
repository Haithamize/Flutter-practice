import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/modules/shop_app/register/cubit/register_cubit.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ShopSettingsScreen extends StatelessWidget {


  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var userEmailController = TextEditingController();
  var userNumberController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ShopUserSuccessState) {
          var model = ShopCubit.get(context).userData;
          firstNameController.text = model.firstName;
          lastNameController.text = model.lastName;
          userEmailController.text = model.email;
          userNumberController.text = model.mobile;
        }
        if(state is ShopUserLoadingState){
          return Center(child: CircularProgressIndicator());
        }

        return Conditional.single(
            context: context,
            conditionBuilder: (context) {
              return (state is! ShopUserLoadingState || state is! ShopUserUpdateDataLoadingState);
            },
            widgetBuilder: (context) {
              return buildSettingsScreen(context, state);
            },
            fallbackBuilder: (context) {
              return Center(child: CircularProgressIndicator());
            });
      },
    );
  }

  Widget buildSettingsScreen(context, ShopStates state) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
              SizedBox(
                height: 15,
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
              SizedBox(
                height: 15,
              ),
              buildDefaultTFF(
                  obsPress: () {},
                  isPassword: false,
                  controller: userEmailController,
                  prefix: Icons.email,
                  type: TextInputType.emailAddress,
                  labelText: 'Email',
                  validate: (String value) {
                    if (value.isEmpty) {
                      return 'Email cannot be empty';
                    }
                    return null;
                  }),
              SizedBox(
                height: 15,
              ),
              buildDefaultTFF(
                obsPress: () {},
                isPassword: false,
                type: TextInputType.number,
                controller: userNumberController,
                prefix: Icons.phone,
                labelText: 'Phone',
                onTap: () {},
                // validate: (String value) {
                //   if (value.isEmpty) {
                //     return 'Phone cannot be empty';
                //   }
                //   return null;
                // }
              ),
              SizedBox(
                height: 10,
              ),
              Conditional.single(
                context: context,
                widgetBuilder: (context) {
                  return buildDefaultButton(() {
                    if (formKey.currentState.validate()) {
                      ShopCubit.get(context).updateUserData(
                          email: userEmailController.text,
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
                          mobile: userNumberController.text);
                    }
                  }, 'Update');
                },
                conditionBuilder: (context) {
                  return state is! ShopUserUpdateDataLoadingState;
                },
                fallbackBuilder: (context) {
                  return Center(child: CircularProgressIndicator());
                },
              ),
              SizedBox(
                height: 15,
              ),
              buildDefaultButton(() async {
                ShopCubit.get(context).currentIndex = 0;
                if(isLoggedWithFacebook){
                  print('Signed out from facebook');
                  await FacebookAuth.instance.logOut();
                  isLoggedWithFacebook = false;
                }else if(isLoggedWithGoogle){
                  print('Signed out from google');
                  GoogleSignIn googleSignIn = GoogleSignIn();
                  googleSignIn.signOut().then((value) {
                    isLoggedWithGoogle = false;
                  });
                }
                signOut(context);
              }, 'LOGOUT'),
            ],
          ),
        ),
      ),
    );
  }
}
