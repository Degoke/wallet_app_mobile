import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/modules/login/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) => Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter some text';
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email',
              ),
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
                border: OutlineInputBorder(),
                hintText: 'Password',
              ),
              controller: passwordController,
              textInputAction: TextInputAction.done,
            ),
            ElevatedButton(
              onPressed: () => onSubmit(_),
              child: const Text('Submit'),
            ),
            ElevatedButton(
              onPressed: () => _.goToSignup(),
              child: const Text('Go to Signup'),
            ),
          ],
        ),
      ));
  }

  void onSubmit(LoginController controller) {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      controller.login(email: email, password: password);
    } else {
      controller.loadingService.showError('Invalid Fields');
    }
  }
}
