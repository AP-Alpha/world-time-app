import 'package:flutter/material.dart';
import 'package:world_time_app/services/worldtime_apicall.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<FetchTime> locations = [
    FetchTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    FetchTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    FetchTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    FetchTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    FetchTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    FetchTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    FetchTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'indonesia.png'),
    FetchTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    FetchTime(url: 'Asia/Kolkata', location: 'India', flag: 'indonesia.png'),
  ];
  void updateTimeNow(index) async {
    FetchTime obj = locations[index];
    await obj.getTime();
    Navigator.pop(context, {
      'location': obj.location,
      'time': obj.time,
      'flag': obj.flag,
      'isDay': obj.isDay,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Colors.blue,
                color: Colors.redAccent,
                // shape: Border,
                child: ListTile(
                  tileColor: Colors.black87,
                  onTap: () {
                    updateTimeNow(index);
                  },
                  title: Text(
                    locations[index].location,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 26,
                      letterSpacing: 3.5,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 19,
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
