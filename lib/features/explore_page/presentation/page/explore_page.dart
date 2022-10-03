import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/explore_page/presentation/widgets/explore_widgets.dart';



class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

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
              body: ConditionalBuilder(
                  condition: state is LoadingGetHotelsState || state is ErrorGetHotelsState || state is LoadingGetBookState || state is LoadingProfileInfoState ,
                  builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Colors.teal,
                        strokeWidth: 2.0,
                      )),
                  fallback: (context) => mainExploreWidget(context),





























              ),
            );
          },
        );
      },
    );
  }
}
