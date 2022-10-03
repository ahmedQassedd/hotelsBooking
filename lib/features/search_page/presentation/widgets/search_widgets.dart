
import 'package:hotels_booking/core/models/search_model.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/navigete_to.dart';
import 'package:hotels_booking/core/util/widgets/show_toast.dart';
import 'package:hotels_booking/core/util/widgets/text_form_field.dart';
import 'package:hotels_booking/features/filter_page/presentation/page/filter_page.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

var searchController = TextEditingController();

var searchFormKey = GlobalKey<FormState>();


AppBar searchPageAppBar(context) => AppBar(
  backgroundColor: Colors.teal,
  title: const Text('Search Page' , style: TextStyle(color: Colors.white),),
  leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: const Icon(Icons.arrow_back_ios_new_outlined ,color: Colors.white)),
);


Widget mainSearchWidget({context , state }) =>
    Form(
  key: searchFormKey,
  child: Padding(
    padding: const EdgeInsets.all(15) ,
    child: Column(children: [
      defaultTextFormFieldWithOnChange(
        change: (){
          AppCubit.get(context).getSearch( context: context , maxPrice: AppCubit.get(context).maxPrice.round() , minPrice: AppCubit.get(context).minPrice.round(), name: searchController.text);
        },
        hint: 'Search',
        controller: searchController,
        inputType: TextInputType.text,
        suffix: Icons.filter_list,
        suffixPressed: (){
          navigateTo(context: context, widget: const FilterPage());
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          if (value!.isEmpty) {
            return 'please enter your Search';
          }
        },),

      const SizedBox(height: 20),

      if( AppCubit.get(context).searchModel != null)
      ConditionalBuilder(
          condition: state is LoadingSearchState,
          builder: (context) => const Center(

              child: CircularProgressIndicator(

                backgroundColor: Colors.white,

                color: Colors.teal,

                strokeWidth: 2.0, )),
          fallback: (context) => Expanded(
            child: ListView.separated(
               physics: const BouncingScrollPhysics(),
                itemBuilder: (context , index) => hotelSearchItem(context, AppCubit.get(context).searchModel , index ) ,
                separatorBuilder: (context , index) => const SizedBox(height: 13,) ,
                itemCount: AppCubit.get(context).searchModel?.data!.total == 7 ? 5 : AppCubit.get(context).searchModel?.data!.total ),
          ),),












    ],),
  ),
);






Widget hotelSearchItem (context ,  model , index) => Container(

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

                  'http://api.mahmoudtaha.com/images/${model.data?.data?[index].hotelImages?[index].image}'),

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

                model.data?.data?[index].name,

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

                        model.data?.data?[index].rate,

                        style: const TextStyle(

                            fontSize: 15,

                            color: Colors.grey,

                            fontWeight: FontWeight.bold



                        ),

                      ),

                    ],

                  ),



                  Text(

                    '${model.data?.data?[index].price}\$',

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