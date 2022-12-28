import 'package:flutter/material.dart';
import 'package:world_time_app/pages/location.dart';
import 'package:world_time_app/service/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void settime () async {
   Worldtime instance = Worldtime(url: 'Europe/Berlin',location: 'Berlin',flag: 'germany.png',time: '');
   await instance.getdata();
   Navigator.pushReplacementNamed(context, '/home',arguments: {
     'location' : instance.location,
     'flag' : instance.flag,
     'time' : instance.time,
     'isDaytime' : instance.isDaytime,
   });
  }

  @override
  void initState() {
    super.initState();
   settime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.blue[900],
      body:Padding(
        padding: EdgeInsets.all(50.0),
        child:Center(
          child : SpinKitCubeGrid(
              color: Colors.white,
              size: 70.0,
            )
        ),
      ),
    );
  }
}
