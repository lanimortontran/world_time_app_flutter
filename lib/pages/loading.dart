import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime('Berlin', 'germany.png', 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(
      context,
      '/home',
      arguments: HomeArguments(
        instance.location,
        instance.flag,
        instance.time,
        instance.isDaytime,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.blueGrey,
          size: 50.0,
        ),
      ),
    );
  }
}
