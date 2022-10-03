import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotels_booking/core/models/get_hotels.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'dart:math' as math;

import 'package:hotels_booking/core/util/widgets/navigete_to.dart';
import 'package:hotels_booking/features/booking_page/presentation/page/booking_page.dart';
import 'package:hotels_booking/features/search_page/presentation/page/search_page.dart';






Widget mainExploreWidget(context) => CustomScrollView(
  slivers: [
    SliverAppBar(
      actions: [
        Padding(
        padding: const EdgeInsets.only(bottom: 10 , right: 10 ),
        child: InkWell(
          radius: 15,
          onTap: (){

            navigateTo(context: context, widget: const SearchPage());

          },
          child: CircleAvatar(radius: 30,
            backgroundColor: Colors.tealAccent.withOpacity(0.5),
            child: const Icon(Icons.search , color: Colors.white,),
          ),
        ),
      ),],
      backgroundColor: Colors.teal,
      expandedHeight: 371.999999999,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(

        //centerTitle: true,
        background: homeSlider(context: context ),
      ),
    ),






    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context , index) => hotelsItem(context, AppCubit.get(context).getHotelsModel , index ) ,
            separatorBuilder: (context , index) => const SizedBox(height: 13,) ,
            itemCount: 5 ),
      ),
    ),


  ],
);






Widget homeSlider({context}) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    CarouselSlider(
        items: AppCubit.get(context).hotelsPics
            .map((e) =>  Image(
          image: NetworkImage(e),
          width: double.infinity,
          fit: BoxFit.cover,
        )


        )
            .toList(),
        options: CarouselOptions(
          reverse: false,
          height: 400,
          viewportFraction: 1.0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 2),
          autoPlayAnimationDuration: const Duration(seconds: 1),
        )),
  ],
);


Widget hotelsItem (context , GetHotelsModel model , index) => InkWell(
  onTap: (){
    navigateTo(context: context, widget:  BookingPage(index: index,));
  },
  child:   Container(

        width: double.infinity,

        height: 150,

        decoration: BoxDecoration(

          color: Theme.of(context).scaffoldBackgroundColor,

          borderRadius: BorderRadius.circular(10),

          boxShadow: [

            BoxShadow(

              color: Colors.grey[300]!,

              blurRadius: 10,

              offset: const Offset(0, 5),

            ),

          ],

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

                        'http://api.mahmoudtaha.com/images/${model.data.data?[index].hotelImages?[index].image}'),

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

                      model.data.data![index].name,

                      style: const TextStyle(

                        fontSize: 16,

                        color: Colors.black,

                        fontWeight: FontWeight.bold,

                      ),

                    ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,



                  children: [

                  Row(

                    children: [

                      const Icon(

                        Icons.star_rate_rounded,

                        color: Colors.amber,

                        size: 24,

                      ),

                      Text(

                        model.data.data![index].rate,

                        style: const TextStyle(

                          fontSize: 15,

                          color: Colors.grey,

                          fontWeight: FontWeight.bold



                        ),

                      ),

                    ],

                  ),



                    Text(

                      '${model.data.data?[index].price}\$',

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

      ),
);





class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;

    // debugPrint('progress => $progress');

    return AnimatedContainer(
      duration: const Duration(seconds: 2),
      // height: progress,
      child: child,
    );
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

