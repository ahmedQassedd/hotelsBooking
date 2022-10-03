import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/button.dart';
import 'package:hotels_booking/core/util/widgets/text_form_field.dart';



var passController = TextEditingController();
var confirmPAssController = TextEditingController();
var passFormKey = GlobalKey<FormState>();



AppBar changePAssPageAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined ,color: Colors.white)),
  title: const Text('Change Password' , style: TextStyle(color: Colors.white),),
);



Widget changePassMAinWidget(context , state) =>  Padding(
  padding: const EdgeInsets.all(15),
  child:   Form(
    key: passFormKey,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


          Text(

            'Change Your Password: ',

            style: Theme.of(context).textTheme.caption,

          ),

          const SizedBox(

            height: 20,

          ),

          defaultTextFormField(

            controller: passController,

            inputType: TextInputType.visiblePassword,

            secure: AppCubit.get(context).secure,

             hint: 'New Password',
              suffix: AppCubit.get(context).suffixIcon,
              suffixPressed: () {
                AppCubit.get(context).showAndHiddenPass();
              },
              prefix: Icons.lock_outline ,

            validator: (value) {

              if (value!.isEmpty) {

                return 'Please enter your New Password!';

              }



              return null;

            },

          ),

          const SizedBox(

            height: 20,

          ),

          defaultTextFormField(

            controller: confirmPAssController,

            inputType: TextInputType.visiblePassword,

            secure: AppCubit.get(context).secure2,

            suffix: AppCubit.get(context).suffixIcon2,
            suffixPressed: () {
              AppCubit.get(context).showAndHiddenPass2();
            },
            prefix: Icons.lock_outline ,

            hint: 'Confirm New Password',

            validator: (value) {

              if (value!.isEmpty) {

                return 'Please Confirm your Password!';

              }



              return null;

            },

          ),
        ],),



       ConditionalBuilder(
           condition: state is! LoadingChangePassState,
           builder: (context) =>  customButton(
               text: 'Save New Password', onPressed: () {
             FocusManager.instance.primaryFocus?.unfocus();
             if(passFormKey.currentState!.validate()){
               AppCubit.get(context).changePass( pass: passController.text , confirmPass: passController.text , context: context);
             }

           }),
           fallback: (context) => const Center(
               child: CircularProgressIndicator(
                 backgroundColor: Colors.white,
                 color: Colors.teal,
                 strokeWidth: 2.0,
               )),),


      ],

    ),
  ),
);