import 'package:flutter/material.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';




AppBar filterPageAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  title: const Text('Filter Page' , style: TextStyle(color: Colors.white),),
  leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined ,color: Colors.white)),
);

Widget mainFilterWidget(context) => Padding(
  padding: const EdgeInsets.all(15),
  child:   Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [


    const Text(

      'Max Price: ',

      style: TextStyle(

          fontSize: 20.0,

          color: Colors.black54,

          fontStyle: FontStyle.italic,

          fontWeight: FontWeight.bold),

    ),

  const SizedBox(height: 10,),



  Row(

  crossAxisAlignment: CrossAxisAlignment.baseline,

  textBaseline: TextBaseline.alphabetic,

  mainAxisAlignment: MainAxisAlignment.center,

  children: [

  Text(

  '${AppCubit.get(context).maxPrice.round()}',

  style: const TextStyle(

  fontSize: 40.0,

  color: Colors.teal,

  fontStyle: FontStyle.italic,

  fontWeight: FontWeight.bold),

  ),

  const Text(

  '\$',

  style: TextStyle(

  fontSize: 25.0,

  color: Colors.teal,

  fontStyle: FontStyle.italic,

  ),

  ),

  ],

  ),



    Slider(

        value: AppCubit.get(context).maxPrice,

        max: 10000.0,

        min: 1000.0,

        onChanged: (value) {

          AppCubit.get(context).filterMaxPrice(value , context);

        }),

      const SizedBox(height: 30,),


      const Text(

        'Min Price: ',

        style: TextStyle(

            fontSize: 20.0,

            color: Colors.black54,

            fontStyle: FontStyle.italic,

            fontWeight: FontWeight.bold),

      ),

      const SizedBox(height: 10,),



      Row(

        crossAxisAlignment: CrossAxisAlignment.baseline,

        textBaseline: TextBaseline.alphabetic,

        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Text(

            '${AppCubit.get(context).minPrice.round()}',

            style: const TextStyle(

                fontSize: 40.0,

                color: Colors.teal,

                fontStyle: FontStyle.italic,

                fontWeight: FontWeight.bold),

          ),

          const Text(

            '\$',

            style: TextStyle(

              fontSize: 25.0,

              color: Colors.teal,

              fontStyle: FontStyle.italic,

            ),

          ),

        ],

      ),



      Slider(

          value: AppCubit.get(context).minPrice,

          max: 1000.0,

          min: 30.0,

          onChanged: (value) {

            AppCubit.get(context).filterMinPrice(value , context);

          }),



      const SizedBox(height: 30,),

      Container(height: 0.5, width: double.infinity, color: Colors.grey[500],),

      const SizedBox(height: 30,),




  ],),
);














