import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Kolkata', location: 'India', flag: 'india.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location',
        style: TextStyle(
            color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blue[900] ,
      ),
      body: SafeArea(
        child : ListView.builder(
            itemCount: locations.length,
          itemBuilder: (context , index) {
               return Card(
                child:ListTile(
                  onTap: () async{

                    WorldTime instance = locations[index];
                    await instance.getTime();
                    print(instance.isDay);
                    Navigator.pop(context ,
                      {
                        'time' : instance.time,
                        'location' : instance.location,
                        'flag' : instance.flag,
                        'url' : instance.url,
                        'isDay' : instance.isDay,
                      }
                    );
                  },
                   leading:  CircleAvatar(
                      backgroundImage: AssetImage('assets/${locations[index].flag}'),
                    ),
                       title: Text(locations[index].location),
                )


              );
          },

        )
      ),
    );
  }
}
