import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Login Screen'),
        actions: [Icon(Icons.login)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //da by5l2li ay masafat maben el widgets w b2dr at7km feha b2a f height w width w kda
                  buildDefaultTFF(
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      isPassword: false,
                      labelText: 'Email Address',
                      controller: emailController,
                      prefix: Icons.email,
                      type: TextInputType.emailAddress),
                  SizedBox(
                    height: 15,
                  ),
                  buildDefaultTFF(
                    type: TextInputType.visiblePassword,
                    prefix: Icons.lock,
                    controller: passwordController,
                    labelText: 'Password',
                    isPassword: isPassword,
                    obsPress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                          emailController.clear();
                          passwordController.clear();
                        }
                      },
                      child: Text(
                        'LOGIN',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: () {},
                        child: Text('Sign UP'),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
