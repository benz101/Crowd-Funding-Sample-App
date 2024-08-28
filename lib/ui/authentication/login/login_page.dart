import 'package:crowd_funding_sample_app/controller/login_controller.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_textform_field.dart';
import 'package:crowd_funding_sample_app/ui/authentication/register/register_page.dart';
import 'package:crowd_funding_sample_app/ui/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  static const routeName = '/login-page';
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text('Welcome to the Login Page :)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const SizedBox(height: 30),
                  // LoginLabelBuilder(controller: controller),
                  const SizedBox(height: 15),
                  LoginFormBuilder(controller: controller),
                  ShowPasswordBuilder(controller: controller),
                  LoginButtonBuilder(controller: controller),
                  const SizedBox(height: 15),
                  const Text('OR'),
                  const SizedBox(height: 15),
                  RedirectToRegisterButtonBuilder(controller: controller)
                ],
              ),
            ),
          );
        });
  }
}

// class LoginLabelBuilder extends StatelessWidget {
//   final LoginController controller;

//   const LoginLabelBuilder({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         color: Colors.transparent,
//         child: const Text(
//           'Welcome to the Login Page :)',
//           textAlign: TextAlign.center,
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
//         ));
//   }
// }

class LoginFormBuilder extends StatelessWidget {
  final LoginController controller;
  const LoginFormBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        color: Colors.transparent,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: PrimaryTextFormField(
                controller: controller.emailCtrl,
                label: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: PrimaryTextFormField(
                controller: controller.passwordCtrl,
                label: 'Password',
                obsecureText: controller.isShowPassword ? false : true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButtonBuilder extends StatelessWidget {
  final LoginController controller;
  const LoginButtonBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 45,
          color: Colors.transparent,
          child: PrimaryButton(
            onPressed: () => controller.loginProcess(),
            label: 'Login',
          )),
    );
  }
}

class ShowPasswordBuilder extends StatelessWidget {
  final LoginController controller;
  const ShowPasswordBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 45,
          color: Colors.transparent,
          alignment: Alignment.centerRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Checkbox(
                  activeColor: Colors.orange[300],
                  checkColor: Colors.white,
                  value: controller.isShowPassword,
                  onChanged: (v) => controller.setShowPassword(v ?? false)),
              const Text(
                'Show Password',
              ),
            ],
          )),
    );
  }
}

class RedirectToRegisterButtonBuilder extends StatelessWidget {
  final LoginController controller;
  const RedirectToRegisterButtonBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 45,
          color: Colors.transparent,
          child: PrimaryButton(
            onPressed: () => Get.toNamed(RegisterPage.routeName),
            label: 'Register',
            isOutlined: true,
          )),
    );
  }
}
