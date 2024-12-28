import 'package:clinex/core/constants/app_colors.dart';
import 'package:clinex/features/clinex/auth/pages/otp_varification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/constants/validations/my_validators.dart';
import '../../presentation/pages/home_screen.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              TextFormField(
                controller: null,
                validator: (value) => MyValidations.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 14,
              ),
              Obx(
                    () => TextFormField(
                  controller: null,
                  obscureText: controller.hidePassword.value,
                  validator: (value) => MyValidations.validatePassword(value),
                  expands : false,
                  decoration:  InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye))
                  ),
                ),
              ),
              const SizedBox(
                height: 9,
              ),

              // Remember me & forget password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Remember me
                  Row(
                    children: [
                      Obx(() => SizedBox(
                        height: 24,width: 24,
                        child: Checkbox(value: controller.rememberMe.value,
                            onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value),
                      )),
                      const Text(' remember me'),
                    ],
                  ),

                  //forget password
                  TextButton(
                      onPressed: () {}, child: const Text('forget password')),
                ],
              ),
              const SizedBox(height: 18),

              // Sign In button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        if (!controller.loginFormKey.currentState!.validate()) {
                          Get.snackbar('Fill Mandatory Fields', '');
                          return;
                        }
                       Get.to(() => OTPVerificationPage(phoneNumber: 'Demo-Number'));
                      }, child: const Text('Sign In'))),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Create Account'))),
              const SizedBox(height: 12,),
              TextButton(onPressed: (){
                Get.offAll(() => const HomeScreen());
              }, child: Text('Skip >',style: TextStyle(color: primaryColor),))
            ],
          ),
        )
    );
  }
}

class MyLoginHeader extends StatelessWidget {
  const MyLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Align(
          alignment: Alignment.topLeft,
          child: Image(
            height: 250,
            width: 300,
            color: Color(0xFF247D80),
            image: AssetImage(
                'assets/logo/logs.png',),
          ),
        ),
        Text(
          'Welcome back,',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Step into comfort,\nLogin to explore more ',
          style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.grey,fontWeightDelta: 1)
        ),
      ],
    );
  }
}


class LoginController extends GetxController{
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
}
