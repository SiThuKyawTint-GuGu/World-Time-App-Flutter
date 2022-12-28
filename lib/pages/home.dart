import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

  data = data.isNotEmpty ? data :  ModalRoute.of(context)!.settings.arguments as Map;
  //set Background image
  String bgImage = data['isDaytime'] ? 'day.jpeg' : 'night.jpeg';
  Color? bgcolor = data['isDaytime'] ? Colors.grey[600] : Colors.black45;

  print(data);
    return Scaffold(
      backgroundColor: bgcolor,
      body: SafeArea(
        child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image:AssetImage(
                  'assets/$bgImage',
              ),
            fit: BoxFit.cover,
          )
        ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,200,0,0),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 30  ,
                  ),
                  ElevatedButton.icon
                    (onPressed:() async {
                   dynamic result =  await Navigator.pushNamed(context, '/location');
                   setState(() {
                     data = {
                        'time' : result['time'],
                        'flag' : result['flag'],
                        'location' : result['location'],
                        'isDaytime' : result['isDaytime'],
                     };
                   });
                  },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, foregroundColor: Colors.black,elevation: 0),
                      icon: Icon(Icons.edit_location,
                      color: Colors.grey[500],),
                      label: Text('Edit Location',style: TextStyle(color: Colors.grey[500]),),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 2,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: 'Orbitron',
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
