
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Admin/login_page.dart';

class Customer_Change_Password extends StatefulWidget {
  const Customer_Change_Password({super.key, required this.name});

  final name;

  @override
  State<Customer_Change_Password> createState() => _Customer_Change_PasswordState();
}

class _Customer_Change_PasswordState extends State<Customer_Change_Password> {
  final formKey = GlobalKey<FormState>();
  var newpassword = TextEditingController();
  var confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            child: Column(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Change Password"),
                TextFormField(
                  controller: newpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Email!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey.shade100,
                    border: OutlineInputBorder(),
                    hintText: "New Password",
                  ),
                ),
                TextFormField(
                  controller: confirmpassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Email!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey.shade100,
                    border: OutlineInputBorder(),
                    hintText: "Confirm Password",
                  ),
                ),
                InkWell(
                    onTap: () async {
                      if (newpassword.text == confirmpassword.text) {
                        print('equal');
                        QuerySnapshot querySnapshot = await FirebaseFirestore
                            .instance
                            .collection('Customers')
                            .where('Customer Name', isEqualTo: widget.name)
                            .get();

                        if (querySnapshot.docs.isNotEmpty) {
                          DocumentReference userDocRef =
                              querySnapshot.docs.first.reference;
                          await userDocRef.update({
                            'Password': newpassword.text,
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Password updated",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          );

                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login_Page(),
                            ),
                          );
                        } else {
                          print('No user found with the provided email.');
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Passwords don't match",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                        print('not equal');
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Container(
                          height: 53,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green),
                          child: Center(
                            child: Text(
                              'Save',
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
