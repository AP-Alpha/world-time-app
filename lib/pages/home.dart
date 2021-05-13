import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String bgImage = data['isDay'] ? "day.jpg" : "night.jpg";
    Color bgColor = data['isDay'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 128, 0, 0),
            child: Column(
              children: [
                FlatButton.icon(
                    color: Colors.redAccent,
                    onPressed: () async {
                      dynamic result =
                          await Navigator.pushNamed(context, '/location');

                      if (result != null) {
                        setState(() {
                          data = {
                            'location': result['location'],
                            'flag': result['flag'],
                            'time': result['time'],
                            'isDay': result['isDay'],
                          };
                        });
                      }
                    },
                    icon: Icon(Icons.location_pin, color: Colors.indigoAccent),
                    label: Text(
                      'Edit location |-_-|',
                      style: TextStyle(
                        color: Colors.grey[300],
                      ),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 50,
                        letterSpacing: 3,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(
                      width: 40.0,
                    ),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                FlatButton.icon(
                    onPressed: () {
                      setState(() {
                        Navigator.pushReplacementNamed(context, '/');
                      });
                    },
                    icon: Icon(Icons.refresh_rounded, color: Colors.white38),
                    label: Text(
                      'REFESH',
                      style: TextStyle(fontSize: 12, color: Colors.white38),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
