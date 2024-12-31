import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Admin/admin_home.dart';
import 'Driver/driver_home.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  bool isLoading = false; // Track loading state

  adlogin() {
    if (email.text == 'admin@gmail.com' && password.text == '123') {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return AdminHomeScreen();
        },
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "CARGO",
                  ),
                  TextFormField(
                    controller: email,
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
                      hintText: "Email",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: password,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Empty Password!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blueGrey.shade100,
                      border: OutlineInputBorder(),
                      hintText: "Password",
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        setState(() {
                          adlogin();
                        });
                      }
                    },
                    child: Container(
                      height: 53,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green,
                      ),
                      child: Center(
                        child: Text('Login'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
