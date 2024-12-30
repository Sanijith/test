
import 'package:flutter/material.dart';

import '../Admin/admin_home.dart';

class Requests extends StatefulWidget {
  const Requests({super.key});

  @override
  State<Requests> createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
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
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(30)),
                height: 100,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "REQUESTS",
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
              child: ListView.builder(
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
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Customer Name $index"),
                            Text("Address $index"),
                            Text("PickUp Time $index"),
                            Row(
                              spacing: 10,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Accept'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreenAccent,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Reject'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
