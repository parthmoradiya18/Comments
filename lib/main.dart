import 'dart:convert';

import 'package:comments/Model/Comments_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Api_Get(),
    debugShowCheckedModeBanner: false,
  ));
}

class Api_Get extends StatefulWidget {
  const Api_Get({Key? key}) : super(key: key);

  @override
  State<Api_Get> createState() => _Api_GetState();
}

class _Api_GetState extends State<Api_Get> {
  List l = [];

  get_Api_Call() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/comments');
    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_Api_Call();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Comments",
          style: TextStyle(
              fontSize: 25,
              color: Colors.lightGreen,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        itemCount: l.length,
        itemBuilder: (context, index) {
          Model m = Model.fromJson(l[index]);
          return Card(
            child: ListTile(
                subtitle: Text(
                  "Email : ${m.email}",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                title: Text(
                  "Name : ${m.name}",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                trailing: Text(
                  "PostId : ${m.postId}",
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                leading: Text(
                  "Id : ${m.id}",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Colors.black,
                  ),
                )),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black,
            thickness: 1,
            height: 1,
          );
        },
      ),
    );
  }
}
