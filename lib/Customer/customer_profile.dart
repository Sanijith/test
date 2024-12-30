
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login_page.dart';
import 'customer_change_psw.dart';

class Customer_Profile extends StatefulWidget {
  const Customer_Profile({super.key});

  @override
  State<Customer_Profile> createState() => _Customer_ProfileState();
}

class _Customer_ProfileState extends State<Customer_Profile> {

  var ID;

  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    SharedPreferences spref = await SharedPreferences.getInstance();
    setState(() {
      ID = spref.getString('id');
    });
    print('Shared Preference data get');
  }

  DocumentSnapshot? Customer;

  getFirebase() async {
    Customer =
    await FirebaseFirestore.instance.collection("Customers").doc(ID).get();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1,
            padding: EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.lightBlueAccent.shade100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 30,
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            Customer!["Customer Name"],
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.email_outlined),
                      trailing: Text(Customer!["Email"]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Card(
                    color: Colors.blueGrey.shade50,
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.phone_outlined),
                      trailing: Text(Customer!["Phone Number"]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Customer_Change_Password(name: Customer!["Customer Name"],),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                          height: 53,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.brown.shade100),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.change_circle_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Change Password',
                                ),
                              ],
                            ),
                          )),
                    )),
                InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Login_Page(),));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                          height: 53,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.logout_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Logout',
                                ),
                              ],
                            ),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
