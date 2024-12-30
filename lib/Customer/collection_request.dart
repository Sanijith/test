
import 'package:flutter/material.dart';

import '../Admin/admin_home.dart';
import 'add_coll_req.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
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
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(30)
                ),
                height: 100,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "COLLECTIONS",
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
                        title: Text("Collection $index"),
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
                            Text("Customer Name $index"),
                            Text("Phone Number"),
                            Text("Address"),
                            Text("Date")
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Add_Coll_Req(),));
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
