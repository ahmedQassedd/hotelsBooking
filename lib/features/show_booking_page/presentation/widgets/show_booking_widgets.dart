
import 'package:hotels_booking/core/models/get_book_model.dart';
import 'package:flutter/material.dart';

AppBar showBookingPageAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  title: const Text('Booked Page' , style: TextStyle(color: Colors.white),),
);




Widget categoryBook (context) =>  Container(
  padding: const EdgeInsets.all(10),
  height: 55,
  width: double.infinity,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(5.0),
    color: Colors.grey.withOpacity(0.4) ,
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      TextButton(onPressed: (){},  child: const  Text('Upcomming' , style: TextStyle(color: Colors.white , fontSize: 17),)) ,

      Container(height: double.infinity, width: 0.5 , color: Colors.white,),

      TextButton(onPressed: (){},  child: const Text('Cancelled' , style: TextStyle( color: Colors.teal, ),)) ,

      Container(height: double.infinity, width: 0.5 , color: Colors.white,),

      TextButton(onPressed: (){},  child:  const Text('Completed' , style: TextStyle(color: Colors.teal ),)) ,




    ],) ,
);


Widget hotelsItem (context , GetBookModel? model , index) => Container(

  width: double.infinity,

  height: 150,

  decoration: BoxDecoration(

    color: Colors.grey[100],

    borderRadius: BorderRadius.circular(10),



  ),

  clipBehavior: Clip.antiAliasWithSaveLayer,

  child: Row(

    mainAxisAlignment: MainAxisAlignment.spaceBetween,

    children: [

      SizedBox(

        width: 150,

        height: 150,

        child: Stack(

          children: [

            Image(
              image: NetworkImage(

                  'http://api.mahmoudtaha.com/images/${model?.data?.data?[index].hotel?.hotelImages?[0].image}'),

              width: 150 ,

              height: 150.0,

              fit: BoxFit.cover,

            ),



          ],

        ),

      ),

      Expanded(

        child: Padding(

          padding: const EdgeInsets.only(top: 10 , bottom: 10 , left: 8 , right:  8),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            crossAxisAlignment: CrossAxisAlignment.start,



            children: [

              Text(

                model!.data!.data![index].hotel!.name,

                style: const TextStyle(

                  fontSize: 16,

                  color: Colors.black,

                  fontWeight: FontWeight.bold,

                ),

              ),

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,



                children: [

                  const Text(

                    'upcomming...',

                    style:  TextStyle(

                        fontSize: 15,

                        color: Colors.grey,

                        fontWeight: FontWeight.bold



                    ),

                  ),



                  Text(

                    '${model.data!.data![index].hotel!.price}\$',

                    style: const TextStyle(

                      fontSize: 18,

                      color: Colors.teal,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ],),

            ],

          ),

        ),

      ),

    ],

  ),

);
