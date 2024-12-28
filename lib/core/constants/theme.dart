import 'package:clinex/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class MyAppTheme {

  MyAppTheme();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: MyTextTheme.lightTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
    checkboxTheme: MyCheckBoxTheme.lightCheckBoxTheme,
    inputDecorationTheme: MyTextFormFields.lightInputDecorationTheme,   // TextField theme
    outlinedButtonTheme: MyOutLinedButton.lightOutLinedButton,

  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.black,
    textTheme: MyTextTheme.darkTextTheme,
    elevatedButtonTheme: MyElevatedButtonTheme.darkElevatedButtonTheme,
    checkboxTheme: MyCheckBoxTheme.darkCheckBoxTheme,
    inputDecorationTheme: MyTextFormFields.darkInputDecorationTheme,  // TextField theme
    outlinedButtonTheme: MyOutLinedButton.darkOutLinedButton,

  );
}


class MyTextTheme{

  MyTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.black),
      headlineMedium : const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.black)
  );
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: const TextStyle().copyWith(fontSize: 32,fontWeight: FontWeight.bold,color: Colors.white),
      headlineMedium : const TextStyle().copyWith(fontSize: 24,fontWeight: FontWeight.w600,color: Colors.white)
  );
}


class MyTextFormFields {

  MyTextFormFields._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100,
    hintStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
  );
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade200,
    hintStyle: const TextStyle(color: Colors.grey),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(16),
    ),
  );
}



class MyCheckBoxTheme {
  MyCheckBoxTheme._();

  static CheckboxThemeData lightCheckBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.blue;
        }else {
          return Colors.transparent;
        }
      })
  );
  static CheckboxThemeData darkCheckBoxTheme = CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      checkColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.white;
        }else{
          return Colors.black;
        }
      }),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if(states.contains(WidgetState.selected)){
          return Colors.blue;
        }else {
          return Colors.transparent;
        }
      })
  );
}
class MyElevatedButtonTheme{
  MyElevatedButtonTheme._(); // to avoid creating instance

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color: Color(0xFF247D80)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color:Color(0xFF247D80)),
        padding: const EdgeInsets.symmetric(vertical: 18),
        textStyle: const TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      )
  );

}

class MyOutLinedButton {

  MyOutLinedButton._();

  static final lightOutLinedButton = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.black,
          side: const BorderSide(color: Color(0xFF247D80)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
      )
  );
  static final darkOutLinedButton = OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          elevation: 0,
          foregroundColor: Colors.white,
          side: const BorderSide(color: Color(0xFF247D80)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600,color: Colors.black,fontSize: 14),
          padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24))
      )
  );
}