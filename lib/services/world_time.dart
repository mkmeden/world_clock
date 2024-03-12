import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String time='', location , url , flag;
  bool isDay =true ;

  WorldTime({required this.location ,required this.flag , required this.url });


  Future<void> getTime() async{

    try{
      Uri link = Uri.parse('https://worldtimeapi.org/api/timezone/$url');
      Response response = await get(link);
      Map data = jsonDecode(response.body);
      // print(data);
      String datetime = data['datetime'];
      datetime= datetime.substring(0 , datetime.length - 6);
      // print(datetime.substring(0 , datetime.length - 6));

      DateTime now = DateTime.parse(datetime);

      time  = DateFormat.jm().format(now);
      isDay = now.hour>6 && now.hour<19 ? true : false;

      // print(time);

    }

    catch(e)
    {

      print('Error caught : $e');
      time = 'Could not find time';
    }

  }




}