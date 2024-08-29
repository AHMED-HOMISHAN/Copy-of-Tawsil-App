// ignore_for_file: unnecessary_null_in_if_null_operators

import 'package:flutter/material.dart';

class ColorTheme {
  static Color primaryColor = const Color.fromARGB(255, 209, 42, 77);
  static Color secondaryColor = const Color.fromARGB(255, 244, 171, 65);
  static Color dangerColor = const Color.fromARGB(255, 164, 32, 57);
  static Color scaffoldColor = const Color.fromARGB(255, 248, 248, 248);
  static Color containerColor = const Color.fromARGB(255, 250, 252, 251);
  static Color textButtonColor = const Color.fromARGB(255, 73, 161, 213);
}

class AppData {
  static String appName = "توصيل";
}

class TempData {
  static List<String> tempTab = ['الكل', 'الاقرب', 'الجديدة', 'المفضلة'];
  static List<Map<String, dynamic>> tempSubCategory = [
    {'name': 'المفضلة', 'image': ''},
    {'name': 'قسم الدجاج', 'image': 'assets/images/c1.jpg'},
    {'name': 'قسم اللحوم', 'image': 'assets/images/c.jpg'},
    {'name': 'المقبلات', 'image': 'assets/images/c3.jpeg'},
  ];
  static List<Map<String, dynamic>> tempCategory = [
    {'name': 'المطاعم', 'image': 'assets/images/c1.jpg'},
    {'name': 'الحلويات والمعجنات والعصائر', 'image': 'assets/images/c.jpg'},
    {'name': ' الأطعمة السريعة ', 'image': 'assets/images/c3.jpeg'},
    {'name': 'الخضروات', 'image': 'assets/images/c4.jpeg'},
    {'name': 'الهدايا', 'image': 'assets/images/c5.jpg'},
  ];
  static List<String> tempAds = [
    'assets/images/ads_1.webp',
    'assets/images/ads_2.webp',
    'assets/images/ads_3.jpeg',
    'assets/images/ads.jpg',
  ];

  static List<Map<String, dynamic>> tempResturant = [
    {
      'name': 'مؤسسة الشيباني للمطاعم',
      'image': 'assets/images/market_1653143520.jpg',
      'rates': 3,
      'address': 'حده - الفندق المقبل بريد حده',
      'isOpen': false,
      'isFavorite': false
    },
    {
      'name': 'مؤسسة الشيباني للمطاعم',
      'image': 'assets/images/market_1653143520.jpg',
      'rates': 3.2,
      'address': 'حده - الفندق المقبل بريد حده',
      'isOpen': false,
      'isFavorite': false
    },
    {
      'name': 'مؤسسة الشيباني للمطاعم',
      'image': 'assets/images/market_1653143520.jpg',
      'rates': 4.5,
      'address': 'حده - الفندق المقبل بريد حده',
      'isOpen': false,
      'isFavorite': false
    },
    {
      'name': 'مؤسسة الشيباني للمطاعم',
      'image': 'assets/images/market_1653143520.jpg',
      'rates': 4,
      'address': 'حده - الفندق المقبل بريد حده',
      'isOpen': false,
      'isFavorite': false
    },
  ];
}

enum BalanceType { arrived, pay }

var result = false;
