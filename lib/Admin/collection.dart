
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'admin_home.dart';

class My_Requests extends StatefulWidget {
  const My_Requests({super.key});

  @override
  State<My_Requests> createState() => _My_RequestsState();
}

class _My_RequestsState extends State<My_Requests> {
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
                    builder: (context) => AdminHomeScreen(),
                  ));
            },
            icon: const Icon(Icons.home_outlined),
            color: Colors.lightGreenAccent,
          ),
        ],
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        title: const Text('CARGO'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.yellowAccent.shade100,
                ),
                height: 100,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "COLLECTION REQUESTS",
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Expanded(
              child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection("Collection Request")
                      .get(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    final request = snapshot.data?.docs ?? [];
                    return ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 20,
                              ),
                              title: Text("Request $index"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.edit_outlined)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.delete_outline))
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(request[index]["Customer Name"]),
                                  Text("Driver Name $index"),
                                  Text(request[index]["Phone Number"]),
                                  Text(request[index]["Address"]),
                                  Text(request[index]["Date"]),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
