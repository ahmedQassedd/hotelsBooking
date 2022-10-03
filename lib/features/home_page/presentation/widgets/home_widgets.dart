import 'package:flutter/material.dart';
import 'package:hotels_booking/core/util/blocs/app_cubit/app_cubit.dart';

Widget mainHomeWidget(context) => BottomNavigationBar(
  onTap: (index) {
    AppCubit.get(context).changeBottomPage(index);
  },
  currentIndex: AppCubit.get(context).currentPage,
  items: const [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Explore'),
    BottomNavigationBarItem(
        icon: Icon(Icons.payment), label: 'Booking'),
    BottomNavigationBarItem(
        icon: Icon(Icons.person), label: 'Profile'),

  ],
);