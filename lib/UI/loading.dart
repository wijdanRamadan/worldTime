
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:worldtime/services/country_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='loading';

  void setupWorldTime() async
  {
    CountryTime countryTime = CountryTime('Paris');

    countryTime.countries = await countryTime.getEuropeanCountries();


    Navigator.pushReplacementNamed(context,'/location',arguments:
    {
      'countries' :countryTime.countries

    });


  }


  @override
  void initState() {

    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitDualRing(
          color: Colors.white,
          size: 80.0,
        ),

      )

    );
  }
}
