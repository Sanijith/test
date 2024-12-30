import 'package:flutter/material.dart';

import 'collection_request.dart';
import 'customer_edit.dart';
import 'customer_profile.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CustomerEdit(),
                    ));
              },
              icon: Icon(Icons.edit_outlined))
        ],
      ),
      body: Stack(
        children: [
          Positioned(
              top: 100,
              left: 70,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Collections(),
                      ));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Add Collection Request")),
                ),
              )),
          Positioned(
              top: 250,
              left: 70,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Customer_Profile(),
                      ));
                },
                child: Container(
                  height: 100,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.redAccent.shade100,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(child: Text("Profile")),
                ),
              )),
        ],
      ),
    );
  }
}
