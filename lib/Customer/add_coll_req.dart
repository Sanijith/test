import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Add_Coll_Req extends StatefulWidget {
  const Add_Coll_Req({super.key});

  @override
  State<Add_Coll_Req> createState() => _Add_Coll_ReqState();
}

class _Add_Coll_ReqState extends State<Add_Coll_Req> {

  final formKey = GlobalKey<FormState>();
  var name=TextEditingController();
  var phone=TextEditingController();
  var address=TextEditingController();
  var date=TextEditingController();
  
  Future<dynamic>collectionlist()async{
    await FirebaseFirestore.instance.collection("Collection Request").add({
      "Customer Name":name.text,
      "Phone Number":phone.text,
      "Address":address.text,
      "Date":date.text,
      "Driver Name":"",
    });
    print("Done");
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
        body: Container(
          child: Column(
            children: [
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
                  hintText: "Customer Name",
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
              TextFormField(
                controller: address,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Empty Address!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade100,
                  border: OutlineInputBorder(),
                  hintText: "Address",
                ),
              ),
              TextFormField(
                controller: date,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Empty Date!";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.blueGrey.shade100,
                  border: OutlineInputBorder(),
                  hintText: "Date",
                ),
              ),
              ElevatedButton(onPressed: (){
                if(formKey.currentState!.validate()){
                  setState(() {
                    collectionlist();
                  });
                }
              }, child: Text("Send"))
            ],
          ),
        ),
      ),
    );
  }
}
