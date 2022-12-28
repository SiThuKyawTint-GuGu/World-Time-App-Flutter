import 'package:flutter/material.dart';
import 'package:world_time_app/service/worldtime.dart';
class location extends StatefulWidget {
  const location({Key? key}) : super(key: key);

  @override
  State<location> createState() => _locationState();
}

class _locationState extends State<location> {

  List<Worldtime> locations = [
    Worldtime(url: 'Europe/London', location: 'London', flag: 'uk.png',time: ''),
    Worldtime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png',time: ''),
    Worldtime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png',time: ''),
    Worldtime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png',time: ''),
    Worldtime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png',time: ''),
    Worldtime(url: 'America/New_York', location: 'New York', flag: 'usa.png',time: ''),
    Worldtime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png',time: ''),
    Worldtime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png',time: ''),
  ];

  void updatetime(index){
    Worldtime instance = locations[index];
    instance.getdata();
    Navigator.pop(context,{
    'location' : instance.location,
    'flag' : instance.flag,
    'time' : instance.time,
    'isDaytime' : instance.isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Location'),
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.5,horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: (){
                 updatetime(index);
                  },
                  title: (
                  Text(locations[index].location.toString())
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
