
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/network/local/cache_helper.dart';
import 'package:hotels_booking/core/util/widgets/navigate_and_finish.dart';
import 'package:hotels_booking/core/util/widgets/navigete_to.dart';
import 'package:hotels_booking/features/change_password_page/presentation/page/change_password_page.dart';
import 'package:hotels_booking/features/sign_in_page/presentation/page/signin_page.dart';
import 'package:hotels_booking/features/update_info_page/presentation/page/update_info_page.dart';

var nameController = TextEditingController();
var emailController = TextEditingController();
var formKey = GlobalKey<FormState>();

AppBar profilePageAppBar(context ) => AppBar(
  backgroundColor: Colors.teal,
  title: const Text('Profile Page' , style: TextStyle(color: Colors.white),),
);

Widget mainProfilePageWidget(context , state) =>  ConditionalBuilder(
    condition: state is LoadingProfileInfoState || state is ErrorProfileInfoState || state is BottomNavShopState ,
    builder: (context) => const Center(

        child: CircularProgressIndicator(

          backgroundColor: Colors.white,

          color: Colors.teal,

          strokeWidth: 2.0, )),
    fallback: (context) => Padding(
      padding: const EdgeInsets.all(10),
      child:   Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: double.infinity,
              height: 150,
              child:   InkWell(
                onTap: (){
                  navigateTo(context: context, widget: const UpdateInfoPage());
                  print(AppCubit.get(context).profileInfoModel!.data!.image);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AppCubit.get(context).profileInfoModel!.data!.image == 'http://api.mahmoudtaha.com/images' ? const  NetworkImage('https://scontent.fcai1-2.fna.fbcdn.net/v/t39.30808-6/309422185_396411202687328_862056201199294861_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=Omqvv63KnpAAX84XO3_&_nc_ht=scontent.fcai1-2.fna&oh=00_AT-QxpF3CoHlo5SHIMtPFEkabExs-L-YbCNRZVLptW4TFQ&oe=633CED69') : NetworkImage(AppCubit.get(context).profileInfoModel!.data!.image),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(

                          AppCubit.get(context).profileInfoModel!.data!.name,

                          style: const TextStyle(

                            fontSize: 20,

                            color: Colors.black,

                            fontWeight: FontWeight.bold,

                          ),

                        ),

                        const SizedBox(
                          height: 7,
                        ),
                        Text(

                          AppCubit.get(context).profileInfoModel!.data!.email,

                          style: const TextStyle(

                            fontSize: 16,

                            color: Colors.black,


                          ),

                        ),
                      ],),
                  ],),
              )
          ),

          Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),

          const SizedBox(height: 4,),

          TextButton(onPressed: (){
            navigateTo(context: context, widget: const ChangePasswordPage());
          }, child: const Text(

            'Change Password',

            style:  TextStyle(

              fontSize: 16,

              color: Colors.black54,

              fontWeight: FontWeight.bold,

            ),

          ),),

          const SizedBox(height: 4,),

          Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),

          const SizedBox(height: 4,),


          TextButton(onPressed: (){

          }, child: const Text(

            'Settings',

            style:  TextStyle(

              fontSize: 16,

              color: Colors.black54,

              fontWeight: FontWeight.bold,

            ),

          ),),

          const SizedBox(height: 4,),

          Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),


          const SizedBox(height: 4,),


          TextButton(onPressed: (){

          }, child: const Text(

            'About Us',

            style:  TextStyle(

              fontSize: 16,

              color: Colors.black54,

              fontWeight: FontWeight.bold,

            ),

          ),),

          const SizedBox(height: 4,),

          Container(height: 0.5, width: double.infinity, color: Colors.grey[400],),

          const SizedBox(height: 4,),


          TextButton(onPressed: (){

            CacheHelper.removeData(key: 'token')?.then((value) {

              navigateAndFinish(context: context, widget: const SignInPage());

            });

          }, child: const Text(

            'LogOut',

            style:  TextStyle(

              fontSize: 15,

              color: Colors.teal,

              fontWeight: FontWeight.bold,

            ),

          ),),

        ],),
    ));














