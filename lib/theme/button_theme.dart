import 'package:flutter/material.dart';

class TElevatedButtonTheme{
  TElevatedButtonTheme._();
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      //side: const BorderSide(color: Colors.blue),
      //padding: const EdgeInsets.symmetric(vertical: 18),
      //textStyle: const TextStyle(fontSize: 16,color: Colors.white,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
    )
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(
      elevation: 1,
      foregroundColor: Colors.white,
      backgroundColor: Color(0xffBB86FC),
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      //side: const BorderSide(color: Colors.blue),
      //padding: const EdgeInsets.symmetric(vertical: 18),
      //textStyle: const TextStyle(fontSize: 16,color: Colors.white,),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))

    )
  );

}