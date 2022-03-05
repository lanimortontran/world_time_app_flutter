import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    // simulate a network request for a username
    // delayed() similar to setTimeout() in JS
    String username = await Future.delayed(Duration(seconds: 3), () => ('yoshi'));

    // await from first call will force this next Future.delayed() to wait till first call is done.
    // If this next Future.delayed() doesn't have an await, the print stmt below will run and display before this finishes
    // simulate network request to get bio of username
    String bio = await Future.delayed(Duration(seconds: 2), () => ('vega, musician, & egg collector'));

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    // Since getData is marked with 'async', the print stmt will run before the func is finished running
    getData();
    print('initState()');
  }

  @override
  Widget build(BuildContext context) {
    print('build()');

    return Scaffold(
      backgroundColor: Colors.grey[200],
      // Since routing is in place, appBar auto adds a back btn
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ElevatedButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Text('counter: $counter'),
      ),
    );
  }
}
