import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/filter_page/presentation/widgets/filter_widgets.dart';



class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool isChecked3 = false;
  bool isChecked4 = false;
  bool isChecked5 = false;
  bool isChecked6 = false;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: filterPageAppBar(context),
              body: Column(children: [
                mainFilterWidget(context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Expanded(
                      child: Column(children: [
                        Row(

                          children: [
                            Checkbox(value: isChecked1,

                                onChanged:(value){

                                  setState(() {
                                    isChecked1 = value!;
                                  });

                                }),

                            const Text('Garden' , style: TextStyle(color: Colors.black),)
                          ],),

                        const  SizedBox(height: 5,),

                        Row(children: [
                          Checkbox(value: isChecked2,

                              onChanged:(value){
                                setState(() {
                                  isChecked2 = value!;
                                });
                              }),

                          const Text('Wifi' , style: TextStyle(color: Colors.black),)
                        ],),

                        Row(children: [
                          Checkbox(value: isChecked3,

                              onChanged:(value){

                                setState(() {
                                  isChecked3 = value!;
                                });

                              }),

                          const Text('A/C' , style: TextStyle(color: Colors.black),)
                        ],),
                      ],),
                    ),

                    Expanded(
                      child: Column(children: [
                        Row(children: [
                          Checkbox(value: isChecked4,

                              onChanged:(value){
                                setState(() {
                                  isChecked4 = value!;
                                });

                              }),

                          const Text('Parking' , style: TextStyle(color: Colors.black),)
                        ],),

                        const  SizedBox(height: 5,),

                        Row(children: [
                          Checkbox(value: isChecked5,

                              onChanged:(value){

                                setState(() {
                                  isChecked5 = value!;
                                });
                              }),

                          const Text('Sea View' , style: TextStyle(color: Colors.black),)
                        ],),

                        Row(children: [
                          Checkbox(value: isChecked6,

                              onChanged:(value){

                                setState(() {
                                  isChecked6 = value!;
                                });

                              }),

                          const Text('Kitchen' , style: TextStyle(color: Colors.black),)
                        ],),
                      ],),
                    ),
                  ],),
              ],),



            );
          },
        );
      },
    );
  }
}
