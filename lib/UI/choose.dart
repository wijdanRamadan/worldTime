
import 'package:flutter/material.dart';
import 'package:worldtime/services/country_time.dart';


class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  void updateTime (index) async{

    CountryTime countryTime = CountryTime(countries[index]);
    await countryTime.getTime(countryTime.location);

    await Navigator.pushReplacementNamed(context, '/home' ,arguments:
    {
      'location':countryTime.location,
      'time' : countryTime.time
    }
    );


  }

  List countries = List();


  @override
  Widget build(BuildContext context) {

    Map data={};
    data=ModalRoute.of(context).settings.arguments;
    countries=data['countries'];


      return Container(
        child: Scaffold(
          backgroundColor: Colors.grey[200],
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            title: Text('Choose a location'),
            centerTitle: true,
            elevation: 0.0,
          ),

          body: ListView.builder(
            itemCount: countries.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(countries[index]),
                ),
              );
            },),

        ),
      );
    }
  }
