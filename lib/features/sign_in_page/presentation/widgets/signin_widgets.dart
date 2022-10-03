

import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/button.dart';
import 'package:hotels_booking/core/util/widgets/navigete_to.dart';
import 'package:hotels_booking/core/util/widgets/text_form_field.dart';
import 'package:hotels_booking/features/sign_up_page/presentation/page/sign_up_page.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

var emailController = TextEditingController();
var passwordController = TextEditingController();

var loginFormKey = GlobalKey<FormState>();


Widget mainWidgetOfSignIn(context , state) => SingleChildScrollView(
  physics: const BouncingScrollPhysics(),
  child: Column(
    children: [

      const SizedBox(
        height: 40.0,
      ),

      SizedBox(
        height: 250,
        width: 250,
        child: Image.asset('assets/logo.png'),
      ),

      const SizedBox(
        height: 50.0,
      ),
      Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Form(
              key: loginFormKey,
              child: Column(
                children: [
                  defaultTextFormField(
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email_outlined ,
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  defaultTextFormField(
                      controller: passwordController,
                      label: 'Password',
                      secure: AppCubit.get(context).secure,
                      inputType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter your password';
                        }
                      },
                      suffix: AppCubit.get(context).suffixIcon,
                      suffixPressed: () {
                        AppCubit.get(context).showAndHiddenPass();
                      },
                      prefix: Icons.lock_outline),
                ],
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            ConditionalBuilder(
              condition: state is! LoadingLoginState,
              builder: (context) => customButton(

                  height: 50,
                  text: 'Sign In',
                  onPressed: () {
                    if (loginFormKey.currentState!.validate()) {

                      FocusManager.instance.primaryFocus?.unfocus();

                      AppCubit.get(context).loginMethod(email: emailController.text, pass: passwordController.text);

                    }
                  }),
              fallback: (context) => const Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                    strokeWidth: 2.0,
                  )),
            ),
            const SizedBox(
              height: 6.0,
            ),
            TextButton(
              onPressed: () {
                FocusManager.instance.primaryFocus?.unfocus();
                navigateTo(
                    context: context, widget: const SignUpPage());
              },
              child: Text(
                'Create an account',
                style:
                Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ),



          ],
        ),
      ),
    ],
  ),
);