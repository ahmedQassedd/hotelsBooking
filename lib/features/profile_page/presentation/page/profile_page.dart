import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/profile_page/presentation/widgets/profile_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: profilePageAppBar(context),
          body: mainProfilePageWidget(context , state),
        );
      },
    );

  }
}
