
import 'package:flutter/material.dart';

import 'customer.dart';
import 'drivers.dart';


class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Positioned(
              top: 100,
              left: 70,
              right: 70,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Drivers(),));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration:BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("Driver Manage")),
                ),
              )),
          Positioned(
              top: 250,
              left: 70,
              right: 70,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Customers(),));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration:BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("Customer Manage")),
                ),
              )),
          Positioned(
              top: 400,
              left: 70,
              right: 70,
              child: InkWell(
                onTap: (){},
                child: Container(
                  height: 100,
                  width: 250,
                  decoration:BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(child: Text("Collection Manage")),
                ),
              )),
        ],
      ),
    );
  }
}
