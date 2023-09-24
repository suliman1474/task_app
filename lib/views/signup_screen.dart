import 'package:flutter/material.dart';
import 'package:task_app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  AuthenticationController controller = Get.find<AuthenticationController>();
  @override
  void dispose() {
    // Dispose of resources in the dispose method
    controller.email.dispose();
    controller.password.dispose();
    controller.confirmpassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'SignUp',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(() {
              return Form(
                key: _formKey,
                child: OverflowBar(
                  overflowSpacing: 20,
                  children: [
                    TextFormField(
                      controller: controller.email,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email is empty';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.black)),
                    ),
                    TextFormField(
                      controller: controller.password,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                      obscureText: controller.isObsecure.value,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: GestureDetector(
                          onTap:
                              controller.toggleObsecure, // Remove the () here
                          child: Icon(controller.isObsecure.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: controller.confirmpassword,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password is empty';
                        }
                        if (text != controller.password.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      obscureText: controller.isObsecure2.value,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: const TextStyle(color: Colors.black),
                        suffixIcon: GestureDetector(
                          onTap:
                              controller.toggleObsecure2, // Remove the () here
                          child: Icon(controller.isObsecure2.value
                              ? Icons.visibility_off
                              : Icons.visibility),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 36,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.createUser();
                          }
                        },
                        child: const Text('Sign Up'),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
