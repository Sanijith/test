import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_Customer extends StatefulWidget {
  const Add_Customer({super.key});

  @override
  State<Add_Customer> createState() => _Add_CustomerState();
}

class _Add_CustomerState extends State<Add_Customer> {

  final formKey = GlobalKey<FormState>();
  var name=TextEditingController();
  var phone=TextEditingController();
  var email=TextEditingController();
  var password=TextEditingController();

  Future<dynamic> customerlist() async {
    await FirebaseFirestore.instance.collection("Customers").add({
      "Customer Name": name.text,
      "Password": password.text,
      "Email":email.text,
      "PhoneNumber":phone.text  ,
    });
    print('done');
    setState(() {
      Navigator.pop(context);
    });
  }
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
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 20,
              children: [
                Text("ADD CUSTOMER"),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Name!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey.shade100,
                    border: OutlineInputBorder(),
                    hintText: "UserName",
                  ),
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
                TextFormField(
                  controller: phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty Phone Number!";
                    } else if (value.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return "Invalid Phone Number";
                    }
                    return null; // Valid input
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.blueGrey.shade100,
                    border: OutlineInputBorder(),
                    hintText: "Phone Number",
                  ),
                ),
                InkWell(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      setState(() {
                        customerlist();
                      });
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'ADD',
                      ),
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
