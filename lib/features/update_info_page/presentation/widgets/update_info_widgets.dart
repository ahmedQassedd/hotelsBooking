import 'dart:io';

import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/button.dart';
import 'package:hotels_booking/core/util/widgets/text_form_field.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';



var nameController = TextEditingController();
var emailController = TextEditingController();
var updateInfoFormKey = GlobalKey<FormState>();





AppBar updateInfoPageAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined ,color: Colors.white)),
  title: const Text('Update Data' , style: TextStyle(color: Colors.white),),
); 



Widget updateMainWidget(context , state) =>  ConditionalBuilder(
    condition: state is LoadingProfileInfoState || state is ErrorProfileInfoState,
    builder: (context) => const Center(

        child: CircularProgressIndicator(

          backgroundColor: Colors.white,

          color: Colors.teal,

          strokeWidth: 2.0, )),
    fallback: (context) => SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child:   Padding(

        padding: const EdgeInsets.all(15),

        child:   Form(

          key: updateInfoFormKey,

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,


            children: [



              Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [



                  Padding(

                    padding: const EdgeInsets.only(top: 10 , bottom: 25),

                    child: AppCubit.get(context).image == null ? Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Stack(

                          alignment: Alignment.bottomRight,

                          children: [

                            Container(

                              width: 150.0,

                              height: 150.0,

                              decoration: BoxDecoration(

                                image: const DecorationImage(

                                  image: NetworkImage('https://scontent.fcai1-2.fna.fbcdn.net/v/t39.30808-6/309422185_396411202687328_862056201199294861_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Omqvv63KnpAAX84XO3_&_nc_ht=scontent.fcai1-2.fna&oh=00_AT-QxpF3CoHlo5SHIMtPFEkabExs-L-YbCNRZVLptW4TFQ&oe=633CED69'),

                                  fit: BoxFit.cover,

                                ),

                                borderRadius: BorderRadius.circular(45.0),

                              ),

                            ),

                            Padding(

                              padding: const EdgeInsets.all(10),

                              child: CircleAvatar(

                                  radius: 15,

                                  backgroundColor: Colors.white.withOpacity(0.7),

                                  child: IconButton(

                                      padding: EdgeInsets.zero,

                                      onPressed: (){



                                        AppCubit.get(context).pickImage();





                                      }, icon: const Icon(Icons.camera_alt_outlined , color: Colors.black54, ))),

                            ),

                          ],

                        )

                      ],

                    ) : Row(

                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [

                        Stack(

                          alignment: Alignment.bottomRight,

                          children: [

                            Container(

                              width: 150.0,

                              height: 150.0,

                              decoration: BoxDecoration(

                                image: DecorationImage(

                                  image: FileImage(File(AppCubit.get(context).image!.path)) ,

                                  fit: BoxFit.cover,

                                ),

                                borderRadius: BorderRadius.circular(45.0),

                              ),

                            ),

                            Padding(

                              padding: const EdgeInsets.all(10),

                              child: CircleAvatar(

                                  radius: 15,

                                  backgroundColor: Colors.white.withOpacity(0.7),

                                  child: IconButton(

                                      padding: EdgeInsets.zero,

                                      onPressed: (){



                                        AppCubit.get(context).pickImage();





                                      }, icon: const Icon(Icons.camera_alt_outlined , color: Colors.black54, ))),

                            ),

                          ],

                        ),

                      ],

                    ),

                  ),



                  Text(



                    'Update Your Date: ',



                    style: Theme.of(context).textTheme.caption,



                  ),



                  const SizedBox(



                    height: 20,



                  ),



                  defaultTextFormField(

                      controller: nameController,

                      inputType: TextInputType.name,

                      hint: 'Name',

                      validator: (value) {

                        if (value!.isEmpty) {

                          return 'please enter your name';

                        }

                      },

                      prefix: Icons.person_outline),



                  const SizedBox(



                    height: 20,



                  ),



                  defaultTextFormField(

                      controller: emailController,

                      hint: 'Email',

                      inputType: TextInputType.emailAddress,

                      validator: (value) {

                        if (value!.isEmpty) {

                          return 'please enter your email';

                        }

                      },

                      prefix: Icons.email_outlined),

                ],),



              const SizedBox(
                height: 260,
              ),

              ConditionalBuilder(

                condition: state is! LoadingUpdateProfileInfoState,

                builder: (context) =>  customButton(

                    text: 'Save New Data', onPressed: () {

                  // FocusManager.instance.primaryFocus?.unfocus();

                  if(updateInfoFormKey.currentState!.validate()){

                    AppCubit.get(context).updateProfile(name: nameController.text , email: emailController.text  , context: context , image: File(AppCubit.get(context).image!.path )) ;


                  }}),

                fallback: (context) => const Center(

                    child: CircularProgressIndicator(

                      backgroundColor: Colors.white,

                      color: Colors.teal,

                      strokeWidth: 2.0,

                    )),),





            ],



          ),

        ),

      ),
    ),);