import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> setupWorldTime() async {
    WorldTime instance = new WorldTime(
        location: 'Qyzylorda',
        flag: 'kazahstan',
        url: 'Asia/Qyzylorda'
    );

    await instance.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDatetime': instance.isDaytime
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
          child: SpinKitRotatingCircle(
            color: Colors.redAccent,
            size: 80.0,
          ),
        )
    );
  }
}
