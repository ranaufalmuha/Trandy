// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:transport_app/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double padSamping = 40;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Column(
            children: [
              //Logo
              const SizedBox(height: 100),
              const Icon(
                Icons.directions_train_sharp,
                size: 100,
              ),

              //username
              const SizedBox(height: 50),
              MyTextField(
                controller: usernameController,
                hintText: 'Username',
                obsecureText: false,
              ),

              //Password
              const SizedBox(height: 10),
              MyTextField(
                controller: passwordController,
                hintText: 'Password',
                obsecureText: true,
              ),

              //forgot password
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padSamping),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),

              //sign in button
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padSamping),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),

              //register
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member? ',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
