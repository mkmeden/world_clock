import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map<String, dynamic> : data;
    // print(data); ==========> here stopped
    String bgImage = data['isDay']== true ? 'day.jpeg':'night.jpeg';
    // print(data['isDay']);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image : AssetImage('assets/$bgImage'),
                    fit: BoxFit.cover
                  ),
                ) ,
                child: Padding(
                  padding:  EdgeInsets.fromLTRB(0 , 100.h, 0 , 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextButton.icon(
                          onPressed: () async{
                       dynamic result = await Navigator.pushNamed(context, '/location');
                       setState(() {
                         data= result;
                       });
                      },
                          icon: Icon(Icons.edit_location ,
                          color: Colors.white,
                          ),
                          label: Text('Edit Location',

                              style: TextStyle(
                                color: Colors.white
                              ),

                          )
                      ),
                      SizedBox(height: 380.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            data['location'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 90.sp,
                              letterSpacing: 2.0.sp
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 1.h,),
                      Text(
                          data['time'],
                        style: TextStyle(
                          fontSize: 196.sp,
                          color: Colors.white
                        ),
                      )
                    ],
                  ),
                ),
              )

          ),
        );


  }
}
