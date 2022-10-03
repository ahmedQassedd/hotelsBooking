
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' ;
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/bloc_observer/bloc_observer.dart';
import 'package:hotels_booking/core/util/network/local/cache_helper.dart';
import 'package:hotels_booking/core/util/network/remote/dio_helper.dart';
import 'package:hotels_booking/core/util/network/remote/end_points.dart';
import 'package:hotels_booking/core/util/widgets/light_theme.dart';
import 'package:hotels_booking/features/home_page/presentation/page/home_page.dart';
import 'package:hotels_booking/features/onboarding-page/onboarding_page.dart';
import 'package:hotels_booking/features/sign_in_page/presentation/page/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper() ;
  await CacheHelper.init();

  token = CacheHelper.getData(key: 'token');
  bool? boarding = CacheHelper.getData(key: 'board');


  Widget firstPage ;

  if(boarding == true){

    if(token == null){
      firstPage = const SignInPage();
    }
    else {
      firstPage = const HomePage() ;
    }
  }
  else {
    firstPage = OnBoardPage();
  }


  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp , DeviceOrientation
    .portraitDown]
  );


  runApp(MyApp(firstPage: firstPage,));
}

class MyApp extends StatelessWidget {

  Widget firstPage ;

  MyApp({ required this.firstPage , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getHotels()..getProfileInfo(),
      child: BlocBuilder<AppCubit, AppStates>(builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightingTheme(),
          home: firstPage ,
        );
      }),
    );
  }
}
