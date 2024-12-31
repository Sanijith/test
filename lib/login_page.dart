import 'package:cargo_app/Admin/admin_home.dart';
import 'package:cargo_app/Customer/customer_home.dart';
import 'package:cargo_app/Driver/driver_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {
  final formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  String selectedUserType = 'Admin'; // Default user type

  bool isLoading = false; // Track loading state

  void login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      if (selectedUserType == 'Admin') {
        // Admin login
        if (email.text == 'admin@gmail.com' && password.text == '123') {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AdminHomeScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Username and password error", style: TextStyle(color: Colors.red)),
          ));
        }
      } else if (selectedUserType == 'Customer') {
        // Customer login
        final user = await FirebaseFirestore.instance
            .collection('Customers')
            .where('Email', isEqualTo: email.text)
            .where('Password', isEqualTo: password.text)
            .get();

        if (user.docs.isNotEmpty) {
          String id = user.docs[0].id;
          SharedPreferences data = await SharedPreferences.getInstance();
          data.setString('id', id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => CustomerHome()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Username and password error", style: TextStyle(color: Colors.red)),
          ));
        }
      } else if (selectedUserType == 'Driver') {
        // Driver login
        final user = await FirebaseFirestore.instance
            .collection('Drivers')
            .where('Email', isEqualTo: email.text)
            .where('Password', isEqualTo: password.text)
            .get();

        if (user.docs.isNotEmpty) {
          String id = user.docs[0].id;
          SharedPreferences data = await SharedPreferences.getInstance();
          data.setString('id', id);
          Navigator.push(context, MaterialPageRoute(builder: (context) => DriverHomeScreen()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Username and password error", style: TextStyle(color: Colors.red)),
          ));
        }
      }

      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("CARGO", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),

                // User Type Selection
                DropdownButton<String>(
                  value: selectedUserType,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedUserType = newValue!;
                    });
                  },
                  items: ['Admin', 'Driver', 'Customer'].map((String userType) {
                    return DropdownMenuItem<String>(
                      value: userType,
                      child: Text(userType),
                    );
                  }).toList(),
                ),

                // Email Input
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

                // Password Input
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

                // Login Button
                isLoading
                    ? CircularProgressIndicator()
                    : InkWell(
                  onTap: login,
                  child: Container(
                    height: 53,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text('Login', style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
