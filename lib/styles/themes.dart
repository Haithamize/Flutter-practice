import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData lightTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      // backgroundColor: HexColor('333739'),
      selectedItemColor: Colors.deepOrange,
      unselectedIconTheme: IconThemeData(color: Colors.black38),
      elevation: 20.0),
  primarySwatch: Colors.red,
  //da eli hyt7km f lon el progress bar eli ana msh 3arf at7km feh w byt7km f lon ay widget ana msh 3arf at7km f lonha
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backwardsCompatibility: false,
    // de lama tb2a b false h2dr a8ayar fl status bar
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ),
    color: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.black
    ),

  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors
            .black), //3mlt override 3la text theme mo3ayan 3shan hst5dmo fl light wl dark mode w hadih lel buildItem eli fl component
  ),
);

ThemeData darkTheme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: HexColor('333739'),
    selectedItemColor: Colors.deepOrange,
    unselectedIconTheme: IconThemeData(color: Colors.grey),
    elevation: 20.0,
    unselectedLabelStyle: TextStyle(color: Colors.white),
  ),
  primarySwatch: Colors.red,
  //da eli hyt7km f lon el progress bar eli ana msh 3arf at7km feh w byt7km f lon ay widget ana msh 3arf at7km f lonha
  scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    // de lama tb2a b false h2dr a8ayar fl status bar
    elevation: 0.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: HexColor('333739'),
    ),
    color: HexColor('333739'),
    iconTheme: IconThemeData(
        color: Colors.white
    ),
  ),
  textTheme: TextTheme(
    bodyText1: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Colors
            .white), //3mlt override 3la text theme mo3ayan 3shan hst5dmo fl light wl dark mode w hadih lel buildItem eli fl component
  ),
);
