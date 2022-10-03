import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/show_booking_page/presentation/widgets/show_booking_widgets.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class ShowBookingPage extends StatelessWidget {

  const ShowBookingPage({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: showBookingPageAppBar(context),
              body: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(children: [
                  categoryBook (context),
                  const SizedBox(height: 20,),

                  ConditionalBuilder(
                    condition: state is LoadingGetBookState || state is ErrorGetBookState || state is BottomNavShopState ,
                    builder: (context) => const Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                          color: Colors.teal,
                          strokeWidth: 2.0,
                        )),
                    fallback: (context) => Expanded(
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context , index) =>  Column(
                            children: [
                              hotelsItem(context, AppCubit.get(context).getBookModel , index ) ,
                            ],
                          ),


                          separatorBuilder: (context , index) => const SizedBox(height: 10,) ,
                          itemCount:  AppCubit.get(context).getBookModel?.data?.total ),
                    ),),
                ],),
              ),





            );
          },
        );
      },
    );
  }


}





