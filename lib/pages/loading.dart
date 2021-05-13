import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time_app/services/worldtime_apicall.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupTime() async {
    FetchTime obj1 = FetchTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await obj1.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': obj1.location,
      'flag': obj1.flag,
      'time': obj1.time,
      'isDay': obj1.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
    setupTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.redAccent,
          size: 70.0,
        ),
      ),
    );
  }
}
