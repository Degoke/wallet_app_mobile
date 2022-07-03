import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wallet_app/modules/signup/controllers/signup_controller.dart';

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: const SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  _SignupFormState createState() {
    return _SignupFormState();
  }
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignupController>(
        init: SignupController(),
        builder: (_) => Form(
              key: _formKey,
              child: ListView(children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'First Name'),
                  controller: firstNameController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Last Name'),
                  controller: lastNameController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Email'),
                  controller: emailController,
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please Enter some text';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Password'),
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                ),
                ElevatedButton(
                  onPressed: () => onSubmit(_),
                  child: const Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: () => _.goToLogin(),
                  child: const Text('Go to Login'),
                ),
              ]),
            ));
  }

  void onSubmit(SignupController controller) {
    if (_formKey.currentState!.validate()) {
      String firstName = firstNameController.text;
      String lastName = lastNameController.text;
      String email = emailController.text;
      String password = passwordController.text;

      controller.signup(
          first_name: firstName,
          last_name: lastName,
          email: email,
          password: password);
    } else {
      controller.loadingService.showError('Invalid Fields');
    }
  }
}
