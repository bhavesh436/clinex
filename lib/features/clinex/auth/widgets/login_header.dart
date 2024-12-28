import 'package:clinex/features/clinex/auth/pages/otp_varification.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class MyLoginForm extends StatelessWidget {
  const MyLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        key: null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Column(
            children: [
              TextFormField(
                controller: null,
              //  validator: (value) => MyValidations.validateEmail(value),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), labelText: 'E-mail'),
              ),
              const SizedBox(
                height: 14,
              ),
               TextFormField(
                  controller: null,
                  obscureText: true,
                //  validator: (value) => MyValidations.validateEmptyText('Password',value),
                  expands : false,
                  decoration:  InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Iconsax.eye_slash))
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
                      SizedBox(
                        height: 24,width: 24,
                        child: Checkbox(value: false,
                            onChanged: (value) {}),
                      ),
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
                        Navigator.push(context, MaterialPageRoute(builder: (builder) => OTPVerificationPage(phoneNumber: '1234567890')));
                      }, child: const Text('Sign In'))),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                      onPressed: () {}, child: const Text('Create Account')))
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
