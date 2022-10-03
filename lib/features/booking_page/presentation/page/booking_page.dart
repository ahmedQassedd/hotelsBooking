import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking/core/models/get_hotels.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/booking_page/presentation/widgets/booking_widgets.dart';




class BookingPage extends StatelessWidget {
   final int index ;

  const BookingPage({ required this.index , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: bookingPAgeAppBar(context) ,
              body: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context , index) => detailsItem(context: context, model: cubit.getHotelsModel , index: index ) ,
                          separatorBuilder: (context , index) => const SizedBox(width: 8,) ,
                          itemCount: cubit.getHotelsModel.data.data![index].hotelImages!.length ),
                    ),

                      bookingMainWidget(context ,index , state),

                  ],)
                ),
              ),
            );
          },
        );
      },
    );
  }

  detailsItem( {context, required GetHotelsModel model, required int index}) =>

    Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(10),

      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
            height: 200,
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(
                      'http://api.mahmoudtaha.com/images/${model.data.data?[this.index].hotelImages?[index].image}'),
                  width: 250 ,
                  height: 200,
                  fit: BoxFit.cover,
                ),

              ],
            ),
          ),

        ],
      ),
    );
}
