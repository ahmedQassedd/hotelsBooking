import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/button.dart';
import 'package:hotels_booking/core/util/widgets/text_form_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';



var nameController = TextEditingController();
var emailController = TextEditingController();
var passController = TextEditingController();
var confirmPassController = TextEditingController();

var formKey = GlobalKey<FormState>();




AppBar appBarSignUp(context) =>  AppBar(
  elevation: 0.0,
  backgroundColor: Colors.white,
  leading: IconButton(
    padding: const EdgeInsetsDirectional.only(start: 15.0),
    onPressed: () {
      Navigator.pop(context);
    },
    icon: Icon(
      Icons.arrow_back_ios,
      color: Colors.grey[600],
    ),
  ),
);




Widget mainWidgetOfSignUp (context , state) => SingleChildScrollView(
  physics: const BouncingScrollPhysics(),
  child: Padding(
    padding: const EdgeInsets.all(24.0),
    child: Form(
        key: formKey,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create an account',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                defaultTextFormField(
                    controller: nameController,
                    inputType: TextInputType.name,
                    label: 'Name',
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your name';
                      }
                    },
                    prefix: Icons.person_outline),
                const SizedBox(
                  height: 30.0,
                ),
                defaultTextFormField(
                    controller: emailController,
                    label: 'Email',
                    inputType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please enter your email';
                      }
                    },
                    prefix: Icons.email_outlined),
                const SizedBox(
                  height: 30.0,
                ),
                defaultTextFormField(
                    controller: passController,
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
                const SizedBox(
                  height: 30.0,
                ),
                defaultTextFormField(
                    controller: confirmPassController,
                    label: 'Confirm-Password',
                    secure: AppCubit.get(context).secure2,
                    inputType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'please Confirm your password';
                      }
                    },
                    suffix: AppCubit.get(context).suffixIcon2,
                    suffixPressed: () {
                      AppCubit.get(context).showAndHiddenPass2();
                    },
                    prefix: Icons.lock_outline),
                const SizedBox(
                  height: 180.0,
                ),
              ],
            ),
            ConditionalBuilder(
                condition: state is! LoadingRegisterState,
                builder: (context) => customButton(
                  onPressed: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    if (formKey.currentState!.validate()) {
                      AppCubit.get(context).registerMethod(name: nameController.text,  email: emailController.text, pass: passController.text, confirmPass: confirmPassController.text);
                    }
                  },
                  text: 'Sign Up',
                  width: double.infinity,
                ),
                fallback: (context) => const Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      color: Colors.teal,
                      strokeWidth: 2.0,
                    ))),
          ],
        )),
  ),
);