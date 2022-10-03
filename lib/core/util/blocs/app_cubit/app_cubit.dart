import 'dart:io';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_booking/core/models/change_pass_model.dart';
import 'package:hotels_booking/core/models/create_book_model.dart';
import 'package:hotels_booking/core/models/get_book_model.dart';
import 'package:hotels_booking/core/models/get_hotels.dart';
import 'package:hotels_booking/core/models/login_model.dart';
import 'package:hotels_booking/core/models/profile_info_model.dart';
import 'package:hotels_booking/core/models/register_model.dart';
import 'package:hotels_booking/core/models/search_model.dart';
import 'package:hotels_booking/core/models/update_profile_info_model.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_states.dart';
import 'package:hotels_booking/core/util/network/local/cache_helper.dart';
import 'package:hotels_booking/core/util/network/remote/dio_helper.dart';
import 'package:hotels_booking/core/util/network/remote/end_points.dart';
import 'package:hotels_booking/core/util/widgets/navigate_and_finish.dart';
import 'package:hotels_booking/core/util/widgets/show_toast.dart';
import 'package:hotels_booking/features/explore_page/presentation/page/explore_page.dart';
import 'package:hotels_booking/features/onboarding-page/onboarding_page.dart';
import 'package:hotels_booking/features/profile_page/presentation/page/profile_page.dart';
import 'package:hotels_booking/features/search_page/presentation/widgets/search_widgets.dart';
import 'package:hotels_booking/features/show_booking_page/presentation/page/show_booking_page.dart';
import 'package:hotels_booking/features/sign_in_page/presentation/page/signin_page.dart';
import 'package:image_picker/image_picker.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitState());

  static AppCubit get(context) => BlocProvider.of(context);



  bool secure = true ;
  bool secure2 = true ;
  int currentPage = 0;

  dynamic minPrice = 30.0 ;

  dynamic maxPrice = 5000.0 ;

  void filterMaxPrice(value ,context ){

    maxPrice = value ;

    AppCubit.get(context).getSearch( context: context , maxPrice: AppCubit.get(context).maxPrice.round() , minPrice: AppCubit.get(context).minPrice.round(), name: searchController.text);

    emit(FilterMaxState());
  }


  void filterMinPrice(value , context){

    minPrice = value ;
    AppCubit.get(context).getSearch( context: context , maxPrice: AppCubit.get(context).maxPrice.round() , minPrice: AppCubit.get(context).minPrice.round(), name: searchController.text);

    emit(FilterMinState());
  }




  IconData suffixIcon = Icons.visibility_off_outlined;

  IconData suffixIcon2 = Icons.visibility_off_outlined;



  void showAndHiddenPass() {
    secure = !secure;
    suffixIcon =
    secure ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SuccessShowPassState());
  }

  void showAndHiddenPass2() {
    secure2 = !secure2;
    suffixIcon2 =
    secure2 ? Icons.visibility_off_outlined : Icons.visibility_outlined;

    emit(SuccessShowPassState2());
  }



  bool lastPage = false;

  double customOpacity = 0;


  void changeOpacity() {
    customOpacity = 1;
    emit(ChangeOpacity());
  }

  void changeLastPage() {
    lastPage = !lastPage;
    emit(ChangeLastPage());
  }

  void skipOnBoard(context) {
    CacheHelper.saveData(key: 'board', value: true).then((value) {
      navigateAndFinish(context: context, widget: const SignInPage());
    });
  }


  List<BoardingModel> pages = [
    BoardingModel(
        image: 'assets/logo.png', title: 'Welcome!', subTitle: ''),
    BoardingModel(
        image: 'assets/hotel2.png',
        title: 'Many types',
        subTitle:
        'Various hotels types already in here we provide it for you.'),
    BoardingModel(
        image: 'assets/hotel3.png',
        title: 'Get you hotel now',
        subTitle:
        'Find your hotel of your choice and get it right now.'),
  ];


  List<String> hotelsPics = [ 

    'https://images.unsplash.com/photo-1601379463077-bba00ffe7da9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
    'https://images.unsplash.com/photo-1644589104114-41ea93fc02e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1936&q=80' ,
    'https://images.unsplash.com/photo-1494247310661-4c9540c6c64f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1667&q=80'
    'https://images.unsplash.com/photo-1601379463077-bba00ffe7da9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80'
  ];

  List<Widget> screens = [
     const ExplorePage(),
     const ShowBookingPage(),
     ProfilePage(),
  ];


  void changeBottomPage(index) {
    currentPage = index;
    if(currentPage == 1){
      getBook();
    }
    else if(currentPage == 2){
      getProfileInfo();
    }
    emit(BottomNavShopState());
  }


  ProfileInfoModel? profileInfoModel;

  void getProfileInfo() {
    emit(LoadingProfileInfoState());

    DioHelper.getData(
            endPoint: profileInfo,
            token: token )
        .then((value) {
      profileInfoModel = ProfileInfoModel.fromJson(value.data);
      emit(SuccessProfileInfoState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorProfileInfoState());
    });
  }


  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = pickedFile;

      emit(PickImageSuccessState());
    }
  }


  UpdateInfoModel?  updateInfoModel ;
  Future<void> updateProfile({String? name , String? email , File? image , context}) async {
    emit(LoadingUpdateProfileInfoState());
    await DioHelper.postDataWithImage(
      endPoint: updateProfileInfo,
      token: token,
      data: FormData.fromMap({
          'name': name,
          'email': email,
          'image': await MultipartFile.fromFile(
            image!.path,
            filename: Uri.file(image.path).pathSegments.last,
          ),
        }),
    ).then((value) {

      updateInfoModel = UpdateInfoModel.fromJson(value.data) ;

      Navigator.pop(context);
      getProfileInfo();
      showToast(text: updateInfoModel!.status!.title!.en);

      emit(SuccessUpdateProfileInfoState());


    }).catchError((onError){

      print(onError.toString());

      emit(ErrorUpdateProfileInfoState());

    });
  }




  ChangePassModel? changePassModel;

  void changePass ({dynamic pass , dynamic confirmPass , context}){

    emit(LoadingChangePassState());

    DioHelper.postData(
        endPoint: changePassword,
        token: token,
        data: {
          'password' : pass ,
          'password_confirmation' : confirmPass ,
          'email' : profileInfoModel!.data!.email ,

        }).then((value) {

      changePassModel = ChangePassModel.fromJson(value.data);
      print(changePassModel!.status!.title!.ar);

      showToast(text: changePassModel!.status!.title!.en);

      Navigator.pop(context);

      emit(SuccessChangePassState());

    }).catchError((onError){

      emit(ErrorChangePassState());


    });

  }




  RegisterModel? registerModel ;
  void registerMethod ({required String name , required String email , required String pass  , required String confirmPass  }){

    emit(LoadingRegisterState());

    DioHelper.postData(
        endPoint: registerEndPoint,
        data: {
          'name' : name ,
          'email' : email ,
          'password' : pass ,
          'password_confirmation' : confirmPass ,

        }).then((value) {

      emit(SuccessRegisterState());

      registerModel = RegisterModel.fromJson(value.data);
      print(registerModel!.status!.title!.ar);

      getProfileInfo();



    }).catchError((onError){

      emit(ErrorRegisterState());


    });

  }





  LoginModel? loginModel ;
  void loginMethod ({ required String email , required String pass  }){

    emit(LoadingLoginState());

    DioHelper.postData(
        endPoint: loginEndPoint,
        data: {
          'email' : email ,
          'password' : pass ,

        }).then((value) {

      loginModel = LoginModel.fromJson(value.data);
      print(loginModel!.status!.title!.ar);
      print(loginModel!.data!.email);

      getProfileInfo();

      emit(SuccessLoginState());

    }).catchError((onError){
      print(onError.toString());


      emit(ErrorLoginState());


    });

  }



  late GetHotelsModel getHotelsModel ;
  void getHotels (){

    emit(LoadingGetHotelsState());

    DioHelper.getData(
      query: {
        'count' : '5',
        'page' :  '1' ,
      },
        endPoint: getHotelsEndPoint,)
        .then((value) {
      getHotelsModel = GetHotelsModel.fromJson(value.data);


      print(getHotelsModel.data.total);


      emit(SuccessGetHotelsState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorGetHotelsState());
    });


  }



  CreateBookModel? createBookModel ;
  void createBookMethod ({ required int hotelId , context }){

    emit(LoadingCreateBookState());

    DioHelper.postData(
        endPoint: createBookEndPoint,
        token: token,
        data: {
          'hotel_id' : hotelId ,

        }).then((value) {

      createBookModel = CreateBookModel.fromJson(value.data);
      showToast(text: createBookModel!.status!.title!.en );
      getBook ();
      Navigator.pop(context);


      emit(SuccessCreateBookState());

    }).catchError((onError){
      print(onError.toString());


      emit(ErrorCreateBookState());


    });

  }


  GetBookModel? getBookModel ;
  void getBook (){

    emit(LoadingGetBookState());

    DioHelper.getData(
      query: {
        'type' : 'upcomming',
        'count' :  '15' ,
      },
      token: token,
      endPoint: getBookEndPoint,)
        .then((value) {
      getBookModel = GetBookModel.fromJson(value.data);


      emit(SuccessGetBookState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorGetBookState());
    });


  }




  SearchModel? searchModel ;
  void getSearch ({


    required dynamic maxPrice ,
    required dynamic minPrice ,
    required String name ,
    context

}){

    emit(LoadingSearchState());

    DioHelper.getData(
      query: {

        'page' : '1',
        'count' :  '15',
        'max_price' :  maxPrice ,
        'min_price' :  minPrice,
        'name' :  name ,
      },
      endPoint: searchEndPoint,)
        .then((value) {

      searchModel = SearchModel.fromJson(value.data);




      emit(SuccessSearchState());
    }).catchError((onError) {
      debugPrint(onError.toString());
      emit(ErrorSearchState());
    });


  }





}
