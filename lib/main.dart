import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './pages/home.dart';
import './pages/choose_location.dart';
import './pages/loading.dart';
void main() => runApp(Main());


class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => MaterialApp(

        initialRoute: '/',
        routes: {
          '/' : (context)=> Loading(),
          '/home' : (context) => Home(),
          '/location': (context) => ChooseLocation(),
        },
      ),

      designSize: const Size(1080 , 2400) ,
    );
  }
}
