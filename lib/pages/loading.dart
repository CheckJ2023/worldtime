import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  // String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(location: 'Berlin', flag:'germany.png', url:'Europe/Berlin');
    await instance.getTime();
    // print(instance.time);
    // setState(() {
    //   time = instance.time;
    // });
    //transfering data with "arguments" to home.dart?
      //I SHOULD LEARN WHAT MOUNTED PROPERTY IS!
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime,
      });
    // await Future.delayed(const Duration(seconds: 2));
  }

  @override
  void initState() {
    super.initState();
    // getData();
    // getTime();
    setupWorldTime();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Center(
          child: SpinKitFadingCube(
            color: Colors.white,
            size:50.0,
          ),
        )
    );
  }
}
