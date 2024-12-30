import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerEdit extends StatefulWidget {
  const CustomerEdit({super.key});

  @override
  State<CustomerEdit> createState() => _CustomerEditState();
}

class _CustomerEditState extends State<CustomerEdit> {
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
    print('Shared Prefernce data get');
  }

  DocumentSnapshot? Driver;

  getFirebase() async {
    Driver = await FirebaseFirestore.instance
        .collection("Drivers")
        .doc(ID)
        .get();
  }

  final formKey=GlobalKey<FormState>();
  var name=TextEditingController();
  var email=TextEditingController();
  var phone=TextEditingController();

  Future<dynamic> EditDriver() async {
    await FirebaseFirestore.instance.collection("Drivers").doc(ID).update({
      "Email": email.text,
      "Phone Number": phone.text,
    });
    print("Edit Successfully");
    Navigator.pop(context);
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
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("EDIT"),
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
                        EditDriver();
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
                        'SAVE',
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
