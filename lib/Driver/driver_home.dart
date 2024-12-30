
import 'package:cargo_app/Driver/profile.dart';
import 'package:cargo_app/Driver/requests.dart';
import 'package:flutter/material.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({super.key});

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
              top: 100,
              left: 70,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Requests(),));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration:BoxDecoration(
                    color: Colors.redAccent.shade100,
                  ),
                  child: Center(child: Text("Requests")),
                ),
              )),
          Positioned(
              top: 250,
              left: 70,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration:BoxDecoration(
                    color: Colors.redAccent.shade100,
                  ),
                  child: Center(child: Text("Profile")),
                ),
              )),
        ],
      ),
    );
  }
}
