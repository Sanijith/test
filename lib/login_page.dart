import 'package:cargo_app/Admin/admin_home.dart';
import 'package:cargo_app/Customer/customer_home.dart';
import 'package:cargo_app/Driver/driver_home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  String id = '';
  String name = '';
  String phoneNumber = '';

  void login() async {
    // Debugging log
    print("Login button pressed");

    // Check for admin credentials
    if (email.text == 'admin@gmail.com' && password.text == '123') {
      print("Admin login successful");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminHomeScreen(),
        ),
      );
    } else {
      // Querying 'Customers' collection
      final customer = await FirebaseFirestore.instance
          .collection('Customers') // Query 'Customers' collection
          .where('Email', isEqualTo: email.text)
          .where('Password', isEqualTo: password.text)
          .get();

      if (customer.docs.isNotEmpty) {
        // If customer is found, save their details in SharedPreferences
        id = customer.docs[0].id;
        name = customer.docs[0]["Username"];
        phoneNumber = customer.docs[0]["Phone Number"];

        SharedPreferences data = await SharedPreferences.getInstance();
        await data.setString('id', id);
        await data.setString('name', name);
        await data.setString('Phone', phoneNumber);

        // Debugging log
        print("Customer login successful. Data saved to SharedPreferences");

        setState(() {
          // Navigate to customer home page (or dashboard)
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CustomerHome(),
            ),
          );
        });
      } else {
        // If no customer found, check the 'Drivers' collection
        final driver = await FirebaseFirestore.instance
            .collection('Drivers') // Query 'Drivers' collection
            .where('Email', isEqualTo: email.text)
            .where('Password', isEqualTo: password.text)
            .get();

        if (driver.docs.isNotEmpty) {
          // If driver is found, save their details in SharedPreferences
          id = driver.docs[0].id;
          name = driver.docs[0]["Username"];
          phoneNumber = driver.docs[0]["Phone Number"];

          SharedPreferences data = await SharedPreferences.getInstance();
          await data.setString('id', id);
          await data.setString('name', name);
          await data.setString('Phone', phoneNumber);

          // Debugging log
          print("Driver login successful. Data saved to SharedPreferences");

          setState(() {
            // Navigate to driver home page (or dashboard)
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => DriverHomeScreen(),
              ),
            );
          });
        } else {
          // If no matching customer or driver found, show error message
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Username and password error",
              style: TextStyle(color: Colors.red),
            ),
          ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        child: Scaffold(
          body: Container(
            height: MediaQuery.of(context).size.height * 1,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('CARGO',
                      style: GoogleFonts.aclonica(
                          fontSize: 30, color: Colors.red)),
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
                          login();
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
                        child: Text('Login',
                            style: GoogleFonts.ubuntu(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
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
