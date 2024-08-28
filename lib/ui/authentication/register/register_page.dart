import 'package:crowd_funding_sample_app/controller/register_controller.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_button.dart';
import 'package:crowd_funding_sample_app/reusable_widget/primary_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  static const routeName = '/register-page';
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: RegisterController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(title: const Text('Register New User')),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 15),
                    RegisterFormBuilder(controller: controller),
                    ShowPasswordBuilder(controller: controller),
                    const SizedBox(height: 15),
                    RegisterButtonBuilder(controller: controller),
                    const SizedBox(height: 15),
                    BackButtonBuilder(controller: controller)
                  ],
                ),
              ),
            ),
          );
        });
  }
}

class RegisterLabelBuilder extends StatelessWidget {
  final RegisterController controller;

  const RegisterLabelBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: Colors.transparent,
        child: const Text(
          'Welcome to the Register Page :)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ));
  }
}

class RegisterFormBuilder extends StatelessWidget {
  final RegisterController controller;
  const RegisterFormBuilder({super.key, required this.controller});

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
                controller: controller.nameCtrl,
                label: 'Nama',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
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
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              color: Colors.transparent,
              child: PrimaryTextFormField(
                controller: controller.passwordConfirmCtrl,
                label: 'Confirm Password',
                obsecureText: controller.isShowPassword ? false : true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterButtonBuilder extends StatelessWidget {
  final RegisterController controller;
  const RegisterButtonBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 45,
          color: Colors.transparent,
          child: PrimaryButton(
            onPressed: () => controller.register(),
            label: 'Register',
          )),
    );
  }
}

class ShowPasswordBuilder extends StatelessWidget {
  final RegisterController controller;
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

class BackButtonBuilder extends StatelessWidget {
  final RegisterController controller;
  const BackButtonBuilder({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
          width: double.infinity,
          height: 45,
          color: Colors.transparent,
          child: PrimaryButton(
            onPressed: () => Get.back(),
            label: 'Back',
            isOutlined: true,
          )),
    );
  }
}
