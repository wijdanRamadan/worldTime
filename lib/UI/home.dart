import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  void loadData() async
  {

  }
  Map data={};
  @override
  Widget build(BuildContext context) {

    data =ModalRoute.of(context).settings.arguments;

    String location = data['location'];
    String datetime = data['time'];






    String  bgImage='day.png';
    Color bgColor =  Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
                              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(children: <Widget>[
                FlatButton.icon(
                    onPressed: (){
                      Navigator.pushNamed(context,'/loading');
                    },
                    icon: Icon(
                      Icons.edit_location,
                    color: Colors.grey[300],
                    ),
                    label: Text('edit location' ,
                    style: TextStyle(color: Colors.grey[300]
                    ),),
                    ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(location,
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white
                      ),
                    )
                  ],
                ),
               SizedBox(height: 20.0),
                Text(datetime ,
                  style: TextStyle(
                    fontSize: 66.0,
                    color: Colors.white
                  ),
                )
              ],),
            ),
          )
      ),
    );
  }
}
