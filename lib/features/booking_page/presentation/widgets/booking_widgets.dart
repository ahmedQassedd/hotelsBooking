
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/button.dart';

AppBar bookingPAgeAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  title: const Text('Hotel Details' , style: TextStyle(color: Colors.white),),
  leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined ,color: Colors.white)),
);



Widget bookingMainWidget(context ,index , state) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    const SizedBox(height: 20,),

    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(

          '${AppCubit.get(context).getHotelsModel.data.data![index].price}\$',
          style: const TextStyle(

            fontSize: 25,

            color: Colors.teal,

            fontWeight: FontWeight.bold,

          ),

        ),
        ConditionalBuilder(
            condition: state is LoadingCreateBookState ,
            builder: (context) => const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  color: Colors.teal,
                  strokeWidth: 2.0,
                )),
            fallback: (context) =>    customButton(text: 'Book Now', width: 120 , color: Colors.teal.withOpacity(0.8)  , onPressed: (){

              AppCubit.get(context).createBookMethod(hotelId: AppCubit.get(context).getHotelsModel.data.data![index].id , context: context);

}),),
    ],),
  const SizedBox(height: 20,),
  SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(

            AppCubit.get(context).getHotelsModel.data.data![index].name,
            style: const TextStyle(

              fontSize: 18,

              color: Colors.black,

              fontWeight: FontWeight.bold,

            ),

          ),
        ) ,
        Row(

          children: [

            Text(

              AppCubit.get(context).getHotelsModel.data.data![index].rate,

              style: const TextStyle(

                  fontSize: 15,

                  color: Colors.grey,

                  fontWeight: FontWeight.bold



              ),

            ),

            const Icon(

              Icons.star_rate_rounded,

              color: Colors.amber,

              size: 28,

            ),

          ],

        ),


      ],),
  ),

  const SizedBox(height: 20,),

  Text(

    AppCubit.get(context).getHotelsModel.data.data![index].address,
    style: const TextStyle(

      fontSize: 15,

      color: Colors.black45,

      fontWeight: FontWeight.bold,

    ),

  ),

  const SizedBox(height: 20,),

  Text(

    '${AppCubit.get(context).getHotelsModel.data.data![index].description}',
    style: const TextStyle(

      fontSize: 14,

      color: Colors.grey,

      //fontWeight: FontWeight.bold,

    ),

  ),
],);