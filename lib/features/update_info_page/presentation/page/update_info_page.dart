import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/features/change_password_page/presentation/widgets/change_password_widgets.dart';
import 'package:hotels_booking/features/update_info_page/presentation/widgets/update_info_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class UpdateInfoPage extends StatelessWidget {


  const UpdateInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    nameController.text = AppCubit.get(context).profileInfoModel?.data?.name;
    emailController.text = AppCubit.get(context).profileInfoModel?.data?.email;


    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: updateInfoPageAppBar(context),
              body: updateMainWidget(context , state),
            );
          },
        );
      },
    );
  }
}
