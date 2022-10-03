import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/widgets/show_toast.dart';
import 'package:hotels_booking/features/search_page/presentation/widgets/search_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class SearchPage extends StatelessWidget {


  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {



          },
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: searchPageAppBar(context) ,
              body: mainSearchWidget(context: context , state: state),

            );
          },
        );
      },
    );
  }


}
