import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime {

  String time; //time from the location
  String? flag;//Location Flag
  String? url;//Url form home page
  String? location;//Choose location
  late bool isDaytime;//True or false

  Worldtime({ this.location, this.flag, this.url,required this.time});


  Future<void> getdata() async {
   try{
     Response response =  await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
     Map data =  jsonDecode(response.body);

     // get data from datetime
     String datetime = data['utc_datetime'];
     String offset = data['utc_offset'].substring(1,3);

     //Convector
     DateTime now = DateTime.parse(datetime);
     now  = now.add(Duration(hours: int.parse(offset)));

     isDaytime = now.hour>6 && now.hour<18? true : false;
     time = DateFormat.jm().format(now);

     print(isDaytime);

   }catch(e){
     print('error: $e');
     time = 'the data is not correct';
   }
  }
}