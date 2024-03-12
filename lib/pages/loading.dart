import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();

}

class _LoadingState extends State<Loading> {




  void setupWorldTime() async
  {
      WorldTime instance = WorldTime(location : 'India' , flag: 'india.png', url:  'Asia/Kolkata') ;
      await instance.getTime();
      Navigator.pushReplacementNamed(context, '/home' , arguments: {
        'location' : instance.location ,
        'time' : instance.time,
        'flag' : instance.flag,
        'isDay' : instance.isDay,
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setupWorldTime();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(

          child: SpinKitCubeGrid(
            color: Colors.black,
            size: 100.0,
          ),
        ),
      ),

    );
  }
}
