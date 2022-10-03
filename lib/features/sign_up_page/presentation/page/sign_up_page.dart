import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/network/local/cache_helper.dart';
import 'package:hotels_booking/core/util/network/remote/end_points.dart';
import 'package:hotels_booking/core/util/widgets/navigate_and_finish.dart';
import 'package:hotels_booking/core/util/widgets/show_toast.dart';
import 'package:hotels_booking/features/home_page/presentation/page/home_page.dart';
import 'package:hotels_booking/features/sign_up_page/presentation/widgets/sign_up_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {
          if (state is SuccessRegisterState ) {

            showToast(text: '${AppCubit.get(context).registerModel?.status?.title?.en}');

            if( AppCubit.get(context).registerModel?.status?.title?.en == 'user created successfuly'){

              CacheHelper.saveData(key: 'token', value: AppCubit.get(context).registerModel?.data?.apiToken).then((value) {

                navigateAndFinish(context: context, widget: const HomePage());
              });


              token = CacheHelper.getData(key: 'token');



              }

          }

          if (state is ErrorRegisterState && AppCubit.get(context).registerModel?.status?.title?.en == 'name already taken' ) {


            showToast(text: '${AppCubit.get(context).registerModel?.status?.title?.en}' , color: Colors.red);

          }
        }, builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBarSignUp(context),
            body:
            mainWidgetOfSignUp (context , state),
          );
        });
      },
    );
  }
}
