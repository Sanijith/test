
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_customer.dart';
import 'admin_home.dart';

class Customers extends StatefulWidget {
  const Customers({super.key});

  @override
  State<Customers> createState() => _CustomersState();
}

class _CustomersState extends State<Customers> {
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
                    color: Colors.amberAccent.shade100,
                    borderRadius: BorderRadius.circular(30)),
                height: 100,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CUSTOMERS",
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
                    future:
                    FirebaseFirestore.instance.collection("Customers").get(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      final customer = snapshot.data?.docs ?? [];
                      return ListView.builder(
                        itemCount: customer.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 20,
                                ),
                                title: Text(customer[index]["Customer Name"]),
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
                                    Text("Phone Number: ${customer[index]["PhoneNumber"]}"),
                                    Text("Email: ${customer[index]["Email"]}")
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Add_Customer(),
              ));
        },
        child: Icon(Icons.add_circle_outline),
      ),
    );
  }
}
